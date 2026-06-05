Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184F1CD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZtMsZCveHI4X8ZrzVj8aDXOsaO+sqyBd2Umre1Tm44=; b=sBX67mdhYX1lKpN8g/p/jJSj18
	ASGADY3VJIMCFoPScquO+LlmOHE5MbCXH8ztImvGVmrKOIs79Vgl6N+qnKOPZO8/d5y2tIF2J7/UM
	Whhmcf3wNTtc4LPwXVZWNYDJG7+JErJSS94u/vUY2+82E2F9PW1XHSS5cH0OtVJEgUYh2Yy0OySvW
	l6Tf7GRUb1BgWsJpIaSH/kd5hptu2xUOl1yiGyKMS5waulfjq03uMgrrTrEy52Td3NxaGrkLgF6gT
	oQwDUYAIa93Y44VgHl/Yq4YtBI2vyZgKs/w4ZussruzI/onlncH5JZQCEknjMX/AfFo6weFEOn6pG
	QdeOXysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTgW-00000000cmo-1ZZo;
	Fri, 05 Jun 2026 12:30:00 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTgS-00000000cmT-37d5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:29:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so2598071a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780662594; cv=none;
        d=google.com; s=arc-20240605;
        b=F+/yXhP/2o0QvOAdOVzfHmYxKjwuxromMAsQDis/ksynwh1QECYps6asIYNckyh14Y
         pmCwKFNqAElNt40R5ok7O0ncppezUOtXzhPPtgFCuxiNw2NuVMDWutd7X54Ov7V9iPjC
         cl/wv3Cj1k/gwjKogAg9fP8pHVxZOEiUrTxpNP1AkojHuRwf+lTqTCohFC72UkCALq+l
         Smn+FbCMWzcp2NFG9r9Cn9oamkp4AYHswaXwCL4l0QX2rogHlFAwqnzWeSrY1qdKWu5R
         GQGYJ/yi1kZoANyUZZLKM39McSz3gnLLbqt7H4gLn2vWlZmmtfSPK8Re8SZHp+7JNdxx
         V0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HZtMsZCveHI4X8ZrzVj8aDXOsaO+sqyBd2Umre1Tm44=;
        fh=2cQ+AT1jffpdofteF36IEuoelipjvFLrD869cGv4jLU=;
        b=gaqCqFFGLRorj6qaX4cz6CUWt58xJI9xhsmeoaCoVaV5A5atfDoGghRhc73WU5KS6s
         i4omuC43NkG/HPRBSVPZoOY7NfW6wMndFVxU+nRBRTtLPJpyy1t0EaUpM6mAHzMHQryb
         DmHKe9KlVtUORAmjPr7Zy4bY3C1VE33XZP4n1LqfzxJKPRcED70tlaRhGBBZ5UyzoJuT
         mqwL17Dn2ICAWvRqnJB9Q/ZefBb+idEve/999lR1c1iSIGXEdhQKVeUlQ4/Wd4/agHhR
         6ZC65D0e1B5N7u7jxMqqIc6w6TM1OhJ7rKtWzkWYsjfq4GYXdYNGJmveZDkJq28e7HUc
         kDAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662594; x=1781267394; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HZtMsZCveHI4X8ZrzVj8aDXOsaO+sqyBd2Umre1Tm44=;
        b=NA13sikYee0Z5KyDqxkQEFjzlruOBGnMDrTBy/a4bHHEIY1yp0xtXlZpdXUfM1n5pg
         6nS7cR3jroiqxcQCiRSiG5J43pt4UBPtwror/JjTJ27dpzVokxmjVEjkTV7WxvyN7mzv
         g/16EIo9StJ6Ni2HNQM0UvuHmSWtVJR1eK7MGJ3Ko+kKkTl2HPwvHL86BHjyj0l+PzDm
         nMPpXm7AP3UZMgSGNb4S9qWD1cNTbun3CLZhHAiNnCqFT1G66dOKIFkZfG1CIo7G6k2r
         m0h0OEKl9/q8DyYVSuTeqp+k0yqZMEi94suQDgWFJHePkoiVPyI0W3+0yF+UCwjRjsyE
         oobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662594; x=1781267394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZtMsZCveHI4X8ZrzVj8aDXOsaO+sqyBd2Umre1Tm44=;
        b=HrKfpQK2ga2OFXOIwjdqcsMih79VLenJ7m+RDNs6yDbeNrKymg1HV83ehLWxwNZWyD
         VR4cHIzy64/ljCpQx6ZegZRWGqQOG0MTpL/w74TT5xVuakbrjsVhKxKuItUYjhSsiD7d
         tpjF/dwvTCz3LQUYpeKBCpTveFTXkQtwVkbCM/jF3YAA7U6gSm+2IjOD2ZswrPcFVNyU
         qg/0RbB63WdWbQHiRJXSGzyRmyUHVY+SHkGAObLiSiz9X5iGHesC8UtPdMbxbnoGMPnT
         MIUEwlk7x6MDnVzXIMXQWoOpVsOCrvMjdbjt8SI8oAiQTKjFuZrM2H0fVUFZXQ01GclC
         VeKg==
X-Forwarded-Encrypted: i=1; AFNElJ8j7/4KwPFRh4x5TvEJPf1TcE8khzBPKg6X/hYywC/8gFusEYi8+N8cOOFz3vmdQb/OuUZ4wZQArNXSXVcnW1VM@lists.infradead.org
X-Gm-Message-State: AOJu0YzF2nnbyvQFLzzexwTycpkjY/UFbnIfle0V+26iBU+UoVnEmSSo
	YKZ76OqD5FvYpGTshQ/P6o2JexY0l5nXWIlnvvynWROYFdr8sMRdvpUXl4AugkdZ+SLSvK//un5
	tQpOKi+YtZZJUmH+BZjRJr4ZlVplZU7o=
X-Gm-Gg: Acq92OGN3bPcPhiE3o/dPEQ5sMRurg3t4wfhTM6ZVK+Pe0xRD3xE6dUFfZ/XGXS8yi1
	snUDP0OyLYkehJC6kfMs61B2jHYW+NaDQXLdH+e6lMNp8SVo6tfAS5iRTO8WaN763bwt7NQBgrc
	kDawpRVhlCbPSC2f6loXBbaS+vPe2b1vWTAAp8msnDuldBX5DUsnuP54ZTnyZA5zLmgmHH2nw2M
	cUzVPqEBRw9ltL4xLil85wwNXJpuWM4bohHoFqyQSp8U2+A6aK9PjGqG44USo+Qs1afrznABO8i
	wYCMQ5voU8xwcRBXeT/vZ8O/NkdO
X-Received: by 2002:a17:906:7950:b0:bed:2a8b:3e72 with SMTP id
 a640c23a62f3a-bf370c66fbemr163870266b.21.1780662593888; Fri, 05 Jun 2026
 05:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260603204721.2200819-1-dbgh9129@gmail.com> <78e66f8f-3998-4051-99a5-7b5fccb40943@amd.com>
In-Reply-To: <78e66f8f-3998-4051-99a5-7b5fccb40943@amd.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 5 Jun 2026 08:29:42 -0400
X-Gm-Features: AVVi8CeJKw290M0R9jenRS-hV9guOrVhzaKPlhY7irgFmv3ztzLNsdBpf4gTFgc
Message-ID: <CACrCO_ULbzeZLh_4iyqiQEjVAeR8OaD14RekExSr26uMxorzXA@mail.gmail.com>
Subject: Re: [PATCH v1] EDAC/synopsys: Fix cleanup on injection sysfs failure
To: Michal Simek <michal.simek@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052956_803235_A53A29AA 
X-CRM114-Status: GOOD (  11.55  )
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

Dear Michal

I appreciate your time reviewing this.

On Fri, 5 Jun 2026 at 05:03, Michal Simek <michal.simek@amd.com> wrote:

> I don't think this is nice way how to do it. I would do it above to avoid using
> ifdefs here.
>
> like this
>                 if (rc) {
>                         edac_printk(KERN_ERR, EDAC_MC,
>                                         "Failed to create sysfs entries\n");
>                         edac_mc_del_mc(&pdev->dev);
>                         goto free_edac_mc;
>
>                 }
>         }
>
Yes, that is cleaner.
I'll update it as suggested and send v2.

Thanks,
Yuho

