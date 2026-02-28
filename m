Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D826FFEE4ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=smD2HaiHLIOJ/xJDEhd0WTnFcnRAIKeje4UXvrICVpU=; b=nFk983lIEzsudV
	VAHn3r4RaPPgWBOKmmdXfoTQtRJ2ZVmyl8ODy5qqESJ6qU/CbtjgNcKwPYTg+SluNeiw/5yCrjzz0
	1mftkEtqX7gnGiQbu7fN43B7pOtFn8AlrBByPlG4FI4X+l4u+DhNfEALdNoZJvFYIXAtboSK+HqWh
	oYL7tE5XApH9DSzcN4MdGtEKWZXFmRBCOKjM/tNXYzZshpQ4KT4yQTKNkGD4KlQQy5clyBrENkUey
	1XvqUzRhGifYdZKVoXHJgGDyRls/ql9Uz7GyWmQEJtop9jvL3FIRXbaGsh/ulvyiyI/k2njp13FCA
	h4UhwIYUCMjXZf8LTsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwMgk-0000000A1CI-3lUv;
	Sat, 28 Feb 2026 15:57:06 +0000
Received: from mail-oo1-f69.google.com ([209.85.161.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwMgh-0000000A1Br-3cYk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 15:57:05 +0000
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679caf7ec07so72404794eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 07:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772294222; x=1772899022;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smD2HaiHLIOJ/xJDEhd0WTnFcnRAIKeje4UXvrICVpU=;
        b=uLrq43B2qj2ok/v44R5XBicdes4T7isFjro40jERM3O0EOEOhp7XEZQRsUFTjz77pc
         yKeVJo7RiWYPg9aqtJ6LbXQok9964em/jgoMdFvghqfBRZzrXakjhOzjfVSljdseQdmg
         bANowIuf0lDXX5HRpTatsFFzeyMZ9j4cAvn1CJ93M6hYxp/eEP4bnsOAL7aBJFIjZLZ0
         tBJtPu+hl0I3RgYRotgbDADPkUxyXyMVy+eP+OLVPOvbXt8uEjZw4H+OAB7BONDf+Obs
         7veSOEhZIHxSre9aGFf/ntI5xrzAJzyI1R8QWGFdcG4ybLecD/n6kIIx2x9aEUcy9JAa
         /Qsg==
X-Forwarded-Encrypted: i=1; AJvYcCVoH70KBPtfL+XQi3QTzWpym4P8JoqDC4hWgIZMHkR7JOBF8YrhepMy5gVzZsTCWWOPmGes+jyDNA1yfPWXk/yz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb32XPUklC/f3gVaYJtXjeCpv5KA7rwKRVMOQOEFXUem7JJZJa
	e99vEDJUYxx9fOPWhn3IrlvxNuhWEnwYHnvDOyuL4mgstoBUHBoic8ehfCSoWsV3LZkUj/QCjC+
	w1J7SAqd0BxIVF7X9LbLAaMlqKFV6Gj1S6ICtF6frk6D5ERTa7odEpMcx5zs=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:228a:b0:66e:7aaa:be76 with SMTP id
 006d021491bc7-679faf0f951mr3959548eaf.43.1772294222196; Sat, 28 Feb 2026
 07:57:02 -0800 (PST)
Date: Sat, 28 Feb 2026 07:57:02 -0800
In-Reply-To: <874in0ex49.wl-maz@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a3104e.050a0220.3a55be.0041.GAE@google.com>
Subject: Re: [syzbot] [kvmarm?] [kvm?] BUG: unable to handle kernel paging
 request in kvm_vgic_destroy
From: syzbot <syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com, 
	syzkaller@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_075703_909345_908D4A16 
X-CRM114-Status: UNSURE (   4.64  )
X-CRM114-Notice: Please train this message.
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com
Tested-by: syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com

Tested on:

commit:         949862c2 KVM: arm64: Eagerly init vgic dist/redist on ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/vgic-fixes-7.0
console output: https://syzkaller.appspot.com/x/log.txt?x=15f88952580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=31d0db0315ae5d07
dashboard link: https://syzkaller.appspot.com/bug?extid=f6a46b038fc243ac0175
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
userspace arch: arm64

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

