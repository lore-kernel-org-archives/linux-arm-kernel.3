Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363CCF34A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B5wttcTQ2tbZAUTjfi72gzveY6La2yQSN4U3CoAM4K0=; b=UbkqrTbhRNwKZxQSwGu4LJ1hnC
	jnIqYeVcKQlq0nyELe0lxigWvbuM0QRSVVaEV8TmI5QhaxYJG6Fnp9lt5ZpLGPY6P5EhGMpauHGGa
	XvzAhp9Jygfr2tJKUpDZJEdzAFfqF7Bf7suH1/sOqGBFh/5ggBLi42Gw547dBmGfBDPyDyZN91h3E
	i/QsgsC591M8APIE8Dd3gMDGxz3CyrJicvhKrqdkJhcT1a01Lc1950XH71r1cd9ctRPFZjUe0A+aP
	BQMFDB6Fi3JoT7ivYZV7AR5rJfUE/xvy7Rn+zB6JqeZXnuJPY2ceoMF+ki/Z5wGQaNvxVg7QG3/5M
	lPMeD+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhik-00000003Cfn-34lM;
	Wed, 19 Nov 2025 12:55:38 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhii-00000003Cf1-09de
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:55:37 +0000
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-43322b98837so80584575ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 04:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556934; x=1764161734;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5wttcTQ2tbZAUTjfi72gzveY6La2yQSN4U3CoAM4K0=;
        b=iCiV0AO12sMV8uW8vlNkUPj5uMiKx2uLeiXv6p+R4P+/k0nJ79T7PJ6mwGllUTi/Da
         DWUFDOr/CWAAv9BIFlbSGNbZ8iaZXgwHoybkRTT2Nfq7qyDzaXsbUTGL7dtA6EoJFusy
         kcxn86A1QQKxLArODpZD6uK++5Hu1NFod4IfPEqCxU1hgL7to2GfyexjE+EGg6d2FsZs
         ffUsjPUfRe+zKzKfPic18eHkXDvepM17GO3gx7ht0o5qiNZPJCfEfEcYx0S8L8nQ4d5e
         VT/v3pBooETAV0Dhna27R9H8wOLLfnyWJlFKGqsySsvPU/J09LyMqiq0GOz8SjktB+CW
         nCxw==
X-Gm-Message-State: AOJu0YwoI9bLo3naty4hc/m36ESmCFojPKaGVc2O1AhVzKUv3fnlWnf/
	aCajJbBxhRNtxlgrBiKd6H2ELFc/X0X3wbC4/W0tnrrfiIS3DZ1/bgfMmFLIONLOi46zXHnNHxz
	NggLDGmraNtGgKj2hzlot0nQJEhxQceCKlQ2jdmu8M585fOIQJTbDbOl6vgI=
X-Google-Smtp-Source: AGHT+IEiyjBwwc6cKF3WYVxWPNzBfHSqQF+3ROtWBWNC9G3x/BKbiT57MUAnz1skLImAC/iOZIFIEfJqMP5NPdW2lU69kirFkJCx
MIME-Version: 1.0
X-Received: by 2002:a92:ca48:0:b0:433:27c1:75c4 with SMTP id
 e9e14a558f8ab-4348c949db9mr278463445ab.31.1763556934287; Wed, 19 Nov 2025
 04:55:34 -0800 (PST)
Date: Wed, 19 Nov 2025 04:55:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <691dbe46.a70a0220.2ea503.0019.GAE@google.com>
Subject: [syzbot] Monthly arm report (Nov 2025)
From: syzbot <syzbot+listf25f891bd9ebf2a1035b@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_045536_074846_70DA10D0 
X-CRM114-Status: UNSURE (   5.40  )
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

Hello arm maintainers/developers,

This is a 31-day syzbot report for the arm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/arm

During the period, 1 new issues were detected and 1 were fixed.
In total, 4 issues are still open and 7 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 265     Yes   WARNING in delayed_work_timer_fn
                  https://syzkaller.appspot.com/bug?extid=e13e654d315d4da1277c
<2> 65      Yes   INFO: task hung in truncate_inode_pages_final (2)
                  https://syzkaller.appspot.com/bug?extid=760777ae7038cad77437
<3> 13      Yes   WARNING in fpsimd_restore_current_state
                  https://syzkaller.appspot.com/bug?extid=d4ab35af21e99d07ce67

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

