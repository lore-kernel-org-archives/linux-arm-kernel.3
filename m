Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A88CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Iagb2rUTGDj6eYGk2excnNHam5SMUj25f8dwqAIwig=; b=TROxxavS8ofJ3QUOpwCEUXKue5
	WlUo8WYNFPF9m8X0ySJusdZGtPdmoId/ul90DPxMd7HO9cM5K8pZP57XozTMBfYNbK81qiRd4d/dm
	gGv8R4MlztP5c+f2M8fG8vQM5qm/RdD61ScWq3Zcvp0NCm0Ua5J5aLTCUBb95dRyM1CsveB63KtBF
	Z4FR24+zFKNsq2immB5W3KY7gy085NN1s8g1E4jqW09qB6RJFmPgWhn9QpCJ5B3b83SblM76EijSC
	rzfrkbnmX3I8014pi59qtieJyFccqMo1RQj7xcqWc9PiZsOsNlgUrSlJwo+TjS9bhdRqZEXFpQJQM
	MlCSu1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSr7p-00000006qW4-1QQt;
	Fri, 29 May 2026 06:55:23 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSr7m-00000006qVZ-3khi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:55:19 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36b7e4e3be0so185562a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 23:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780037718; x=1780642518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iagb2rUTGDj6eYGk2excnNHam5SMUj25f8dwqAIwig=;
        b=NoRqeaCcROAqsvK6+08r7V5HXkSgAlYYL9V9UYPmvpVIuDDxYIM0XLwo9pRFCRi/Ft
         ++YSZ6Fsw9KcMsdsp2mVw4HGhSdXmpWiv3dF5yU4sNggncb7Bb784AFO+ItdNoWi6D18
         ZBaR1bOd64IY6XPEMH6VL3sCHA9ANt71Xdrhd6ubvZZQZm3WNxY2UqfHLgTfIWngxNf+
         ycE+cljnPOBiD5J97McUyxlhAh5JieUnxA94ASra56aacxZwxyu2xdDUPFbXgunvMPTH
         x7wc41T1eTFzJl+3+efvXQM72O4g5zzNmbPohNtYZq06LSuBp9U936ox8B+6+yjOBLJ6
         F1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037718; x=1780642518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Iagb2rUTGDj6eYGk2excnNHam5SMUj25f8dwqAIwig=;
        b=ZEXHR36QiM1RZsr6QANskpX7wpy5BmODreoGb8gdZSJris8MJy7q5pkvdls6Mt/R0g
         kPMydKwwXeIW9JZnFGRx82Sqf0g5rJiBZ5aOMuyU4ELHPET6IEYs8WiHmivIj/Q//MeP
         dCyCUyvw0JQDphzw/BlMAUX6Np+iJ2FRJP9uOFkgSqblMPzwluF1/qqK3KXrYEeNd2Q1
         KM2+6am0In15dXnTQQ/11xbEq732cZTi+99izkFMX+PvEBW0ab+lwRczFJ5su+RVF+qL
         WGzSl9Vx2cwVVWctMbADmFnor6Qfg83NDnPvsfW44cxq+oejWA+4DEYZnsLKxcN6hLtt
         CgJg==
X-Forwarded-Encrypted: i=1; AFNElJ95rQWz8VwfNBXPDfxmkCnQe+gZs03U8zdUGhxicb0zmgNiMQFeS8ublxl8Obsw+7uliUY1IokHN6f98uMBgtQY@lists.infradead.org
X-Gm-Message-State: AOJu0YzU38DlMHmv/6SLSCrmLRlOK9vn2LM8W0jf3gX1UqzC2XqWp+lD
	1orArIZQA1a1Dx3UbZYPH4cHVKJboZrW3nn9jyos2wMTvqBJYRR6mtHD
X-Gm-Gg: Acq92OEitLqaSOOTiZBH0cjq/i1IGFgjW9KxL5NjoSRnmO1nCixMNQRorAfsqQZUl39
	S6Gs1mFS/5krlnafROmDTD6Sqvd7O8daM5BhlkH4Jx6lFqZDISb9XyczYR2w1Q8VoAb8Pfjbosq
	nqsnbjQvqBXUplEuyORnCV6pM/pktZUzjTiVKofRM5U0xG/F0I0VwRB7ce9X69yFvFxlyI9xndl
	NyyR5em+LZmNaFIUQ7xOsVsLJjSkRbMYjzy6r0k9UzLmqd6NtLZGB0lbqKQlWhSgLgT/zpFQXcT
	GqxLBB3Xo4xJfNWSaOXBKE+bWiZ0csQ2XLxb9ieWNrhamOUKfA3/TFbVyPH98iezAhb38BHzjuD
	V9vYYi/vv1nPbIxW4yzfICRAXNwtIiF+BBw97fFy+0J6O6hx5XmDriOAmkz3D8h0+VuVAz3nVc4
	KeAZdIVZsa7/QzlH0+PxeOSokhVahzhXgOaP7oTJjeD4A=
X-Received: by 2002:a17:90b:2701:b0:366:2b56:3ec2 with SMTP id 98e67ed59e1d1-36bbcac2603mr1125096a91.1.1780037717407;
        Thu, 28 May 2026 23:55:17 -0700 (PDT)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6621745sm1121405a91.7.2026.05.28.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:55:16 -0700 (PDT)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com,
	will@kernel.org,
	Yiqi Sun <sunyiqixm@gmail.com>
Subject: [PATCH] fix: arm64: syscall: use live x0 for syscall_get_arguments() arg0
Date: Fri, 29 May 2026 14:54:44 +0800
Message-Id: <20260529065444.1336608-1-sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_235518_933710_5059D453 
X-CRM114-Status: GOOD (  12.66  )
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

On arm64, seccomp obtains syscall arguments via syscall_get_arguments(),
where arg0 is currently read from regs->orig_x0. However, the syscall
wrapper consumes live arguments from regs->regs[0..5].

A ptracer can modify x0 on syscall-enter stop before seccomp runs,
but cannot update orig_x0 through that interface. This can
leave seccomp checking stale arg0 while the syscall executes with updated
live x0, allowing seccomp bypass when filters depend on arg0.

Make syscall_get_arguments() read arg0 from regs->regs[0], matching the
actual dispatch arguments and removing this desynchronization.

Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
---
 arch/arm64/include/asm/syscall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 5e4c7fc44f73..4bdb4d3ce2b4 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -81,7 +81,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned long *args)
 {
-	args[0] = regs->orig_x0;
+	args[0] = regs->regs[0];
 	args[1] = regs->regs[1];
 	args[2] = regs->regs[2];
 	args[3] = regs->regs[3];
-- 
2.34.1


