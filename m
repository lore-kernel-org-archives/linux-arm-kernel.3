Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E443DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8Qqgiq8JxyEcAgDrZLb+6D8UwLrwRRPLE/xGlnoIsFU=; b=hCueNTJr59tkZ0
	0JTKLE1Hd1zIPbnH06VoSQCAY9KIPDUQb81d8U7Q6Sq/HYSwxBqsyfQIOapG/uH9PUiJfJ3F2PInl
	9sg57LYymV1pqIgxuSdFbLsFqk4ftO6kiM+NNm2CRW8Wj+yvDQfUxX7RAh84c2Um19oTDDRP9mWL/
	50RN/RrqdAN0mxU81k68Hy7D3WO1IiktdmTTSVmXebpVft01gHzS2Nqk0N9uCYNf9k76/VLZQtcmD
	0h0NMOSkShwPhle0KoOs+i2TRrPxgUbEOs9qaoQUWYvWO7S+T/DN1RqxEdngyWgDHaucCcCjCLbqD
	jD+TvVxDDPsPxIE4Sd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnL-00000002Zgb-1pk5;
	Mon, 14 Jul 2025 15:08:43 +0000
Received: from mail-io1-f69.google.com ([209.85.166.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK3D-00000002SSt-38rN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:21:06 +0000
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-879489ddf11so834536739f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 07:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502862; x=1753107662;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Qqgiq8JxyEcAgDrZLb+6D8UwLrwRRPLE/xGlnoIsFU=;
        b=evSFq2Xp6vLK+fIFnwcXZkK6rMM7k5B8xDCSp22znu4hu4lChVbgR7he3nDpxQ5olr
         U55lao9o9jG9/WsudPk2tqxljfwj2JlVUTxS3GZFF1Cob4WmRMXSKm4TdLRFEyQsLnlQ
         O+PgiXCLz2QOT7+/tlez05yd5T0U+S7pT1m1zvPzYHq2R8TcZsKqP4GiZLGGW/UmxM8I
         2TdEofY+yZWE6G2E6qT/GWJP/4Hk8Po40av1MdQ265S8jYSQN9XxW2z8r1mQi74wGA/G
         2LgG2rcbJW9UBhwceGRUEbWspv8ze0V1PaBJcW+PGsfcLbnN9nyP4aTmYDQK97HdqzpN
         eeHw==
X-Forwarded-Encrypted: i=1; AJvYcCVio0mmcpq5h6oBvn2AI9h2ox++DGhm6hAcKLR2oF/7VFaOl7R+ijzLI2lCvHuU36VEx9vDTztKcOAMkTjiERCD@lists.infradead.org
X-Gm-Message-State: AOJu0YxdI2Q0Vl6P7es/gyRLGQJUMSi4K66FXs2m2QN5tA+99reki1PS
	2D7xnAAWMjW2B6V4kvwk1QxGOA+HiD7G01oLUYYbqicU5B9JhVj7UXONdMByozyA++M1u+ZzBGy
	MfSK+LeTIlABnaR5NXpjjvCyd4hGwtIKa7qvwuuOM8e6L9pLE1xqonuLc9Yk=
X-Google-Smtp-Source: AGHT+IGSjX8dQuyeF+nrdRxt2lvfKv070vfD+xMFqoSuPZlV/8eE5ffgfNQmsMmBill3U8kjHbWGi/Yiq1YgCqNWyw/IWLC2bkZV
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6808:b0:875:d589:5b0b with SMTP id
 ca18e2360f4ac-8797aa2f686mr1289387039f.11.1752502862398; Mon, 14 Jul 2025
 07:21:02 -0700 (PDT)
Date: Mon, 14 Jul 2025 07:21:02 -0700
In-Reply-To: <861pqiaojt.wl-maz@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6875124e.a70a0220.2b0948.0001.GAE@google.com>
Subject: Re: [syzbot] [kvmarm?] WARNING in pend_sync_exception
From: syzbot <syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072103_786783_C01F8FC8 
X-CRM114-Status: UNSURE (   4.66  )
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

Reported-by: syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com
Tested-by: syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com

Tested on:

commit:         e62014ac KVM: arm64: Clear pending exception state bef..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/df-2-fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=17d1918c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4b46866d7105151
dashboard link: https://syzkaller.appspot.com/bug?extid=4e09b1432de3774b86ae
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
userspace arch: arm64

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

