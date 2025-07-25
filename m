Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AA5C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 04:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxFwecxr/0B2ef20Od5cEy15w6qiFnt04wlLQ+u7uOU=; b=cByszhBObhHLW7KNqCrxCcLmgP
	bx/6km5OlvNGZhnCi3bI07g8KdxpdG8KYMP2qf3L/4XM4V9xiUZ6lcbehqL6ReZbQWGGaI0cTba+i
	0miaHAarVFyEtrwPOI22yqOvbvFvEVItftH+p8wGc0O/ebq4FP4kHhXFLWG1jUFXks3kv6w70UX3M
	zrHCWxmO/o9CjEFqBh4ud3vq4ZiI5Ywu8Iuavxr4lTw1AZeXJDyggXKDhpX7iqYCAXo2bvovzGHKn
	U3hoR8teDEHjTiezecA9jPKgS0yhMkUzbYRoToDe8l5mernkRDskbMcOqOOlCOzFbswaPnQ05oIsn
	J6Lh428g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf9k0-000000090hd-2NT2;
	Fri, 25 Jul 2025 04:09:04 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf9hS-000000090dl-1fSe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 04:06:27 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so893162fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 21:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753416385; x=1754021185; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MxFwecxr/0B2ef20Od5cEy15w6qiFnt04wlLQ+u7uOU=;
        b=ikt3dHxLPxkGOZfQXd9B0psSV+/P87bcZioNY+Vbdd38y5RW+21ysY1XIQHiNL+EnT
         tviz5XDWD6xvGZVSEd/rCCNrmP07700WvpzFzX7rl/86FcagnLhBryzQE+lAH/KvLQUm
         Xp+8kqHXejHlU1nApv5uGjqderQArMdBoN7v/Q8d9iCKElQbbZn7f7QmuBRPI61ECD7O
         tvt9iwDPjYUKPae0i0Slo/KH5acKyPl0x8SsyhKUIjvux8Ba9f8LvzDLSBSX8CHTSJSj
         duEu80yxaarpl61GoWN/2ykVmxA8CYWLyTeRUm2UE7R3hXbJTNULWa8o3ulWkoH64ysh
         VUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753416385; x=1754021185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxFwecxr/0B2ef20Od5cEy15w6qiFnt04wlLQ+u7uOU=;
        b=dKDssgY1/0NMcoRjpj0MjKXPUwa4ibTJ8sejtyr6Xc8BHQ1ChrxiCiV+ztvoI0FyEE
         VtkLEFjqCsK1JenQf/EIbIjqYwNhVFDGgBVmg75zjTp2aHxMgcZ6uKtYZpD2P7PjEBZG
         biXQXm2DsqypUHOZdbfPrkuTlo32ytbzX98JUryJprq/Jmz+rzc5FgL9dBkeqCea6Ndx
         hWPTrReFmjnzu7pZWTXbpaBZBGL2auwCkVVPAwAdb3Rm64h6IpIaGuc+sqlFJ1bBCaM2
         Gr7RDAokhbKspNry/qiVLJ4X73dMZqmttHf6+//8OKxQo8EM9AnhM8i2b69ArHgoH9zJ
         v1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWQOA2WDLiDsRObFkonsfROSCBEWuMGSmvHKsd1fRpdYMWG+Cnrc4r5CY0tdnzZWUDhXgDvkm3lJwxSjznsH2e3@lists.infradead.org
X-Gm-Message-State: AOJu0YxDAEnhNZ3ezr4UUDbb0jLUAnei1E88mg/azxMxSQyYzMvDrz5Q
	giHB3szNPlE0yhNJz3O7hMR5tUNbk2cI59PzMjU6SJtLHTCOWEo/AeUoVj+RI7JXGRpQf6dc66W
	vJq/ZjEE/BMKSRkqB616/Fu+ue/ENZ/0=
X-Gm-Gg: ASbGncvj+DDJG4hnip3FKBY1Qf3k2U/hHMghZkeaoaiOcpMX2YeQ9VGAXNh05Av8ZNI
	Z5TGNOA/gBlFICrcxZiTP8orZejtgdHyVdrttTBcoXN/SRpAZmpgkU3B/CwCYLxuIbaRyoDTjXW
	vg88qwGHTJRmgBSLnGl3vRfyXohLF/N29YiM5d4qjsLZB+wqf+FFguzMMujoYPvcYq0CTmJSg8z
	/n3lEVPll6Um8eM8M4=
X-Google-Smtp-Source: AGHT+IGBZ7w/dfI527SR+DjinfNWuVbsu36wytkW8N4l6YT8Yd5aYP89lAVW8ZijJwwDy/9hDaIyx8WtdOiU1h8rzkU=
X-Received: by 2002:a05:6870:9e8b:b0:2ff:8c8e:c222 with SMTP id
 586e51a60fabf-30701d5dc82mr361913fac.14.1753416385412; Thu, 24 Jul 2025
 21:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250724165639.13926-1-suchitkarunakaran@gmail.com> <90864bf5-2edb-4901-9566-c89431c6d717@arm.com>
In-Reply-To: <90864bf5-2edb-4901-9566-c89431c6d717@arm.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Fri, 25 Jul 2025 09:36:14 +0530
X-Gm-Features: Ac12FXz44GOWvQ9VHe3SSaOhUjxs0ZPwCO46dWoM-kiLqy_XkQMRtojfL8c4zg4
Message-ID: <CAO9wTFgFqmKWdF5bhpqh2ffrUb7QH8mqUNH1nieOMDFn_fUcDA@mail.gmail.com>
Subject: Re: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default accordingly
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_210626_439919_D79767A9 
X-CRM114-Status: GOOD (  21.68  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 25 Jul 2025 at 07:46, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 24/07/25 10:26 PM, Suchit Karunakaran wrote:
> > The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
> > This patch changes the minimum allowed CPUs to 1, enabling single-core
> > non-SMP configurations.
> >
> > Additionally, the default value for NR_CPUS is now conditional:
> > - Defaults to 1 if SMP is not selected (non-SMP systems)
> > - Defaults to 512 if SMP is enabled
>
> Just curious - what actually prompted this change ?
>

Hi, sorry I think I should've explained it in the commit message. So,
in linux/include/linux/threads.h, there's this fixme comment:
/*
 * Maximum supported processors.  Setting this smaller saves quite a
 * bit of memory.  Use nr_cpu_ids instead of this except for static bitmaps.
 */
#ifndef CONFIG_NR_CPUS
/* FIXME: This should be fixed in the arch's Kconfig */
#define CONFIG_NR_CPUS 1
#endif

And the original commit is as follows:

commit 278d1ed65e25d80af7c3a112d707b3f70516ddb4
Author: Rusty Russell <rusty@rustcorp.com.au>
Date:   Tue Dec 30 09:05:12 2008 +1030

    cpumask: make CONFIG_NR_CPUS always valid.

    Impact: cleanup

    Currently we have NR_CPUS, which is 1 on UP, and CONFIG_NR_CPUS on
    SMP.  If we make CONFIG_NR_CPUS always valid (and always 1 on !SMP),
    we can skip the middleman.

    This also allows us to find and check all the unaudited NR_CPUS usage
    as we prepare for v. large NR_CPUS.

    To avoid breaking every arch, we cheat and do this for the moment
    in the header if the arch doesn't.

    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
    Signed-off-by: Mike Travis <travis@sgi.com>

diff --git a/include/linux/threads.h b/include/linux/threads.h
index 38d1a5d6568e..052b12bec8bd 100644
--- a/include/linux/threads.h
+++ b/include/linux/threads.h
@@ -8,17 +8,17 @@
  */

 /*
- * Maximum supported processors that can run under SMP.  This value is
- * set via configure setting.  The maximum is equal to the size of the
- * bitmasks used on that platform, i.e. 32 or 64.  Setting this smaller
- * saves quite a bit of memory.
+ * Maximum supported processors.  Setting this smaller saves quite a
+ * bit of memory.  Use nr_cpu_ids instead of this except for static bitmaps.
  */
-#ifdef CONFIG_SMP
-#define NR_CPUS CONFIG_NR_CPUS
-#else
-#define NR_CPUS 1
+#ifndef CONFIG_NR_CPUS
+/* FIXME: This should be fixed in the arch's Kconfig */
+#define CONFIG_NR_CPUS 1
 #endif

+/* Places which use this should consider cpumask_var_t. */
+#define NR_CPUS CONFIG_NR_CPUS
+
 #define MIN_THREADS_LEFT_FOR_ROOT 4

 /*

This motivated me to do this. Please let me know if I misunderstood
something or I'm doing something incorrectly.

