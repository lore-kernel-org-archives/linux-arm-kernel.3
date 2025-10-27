Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A479CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC0J3akmB3TXc++y+3XKXioAKP3259FgNBDBPlznVPQ=; b=W83y2e6JX2IgJRoKsY9n5F3Uqh
	1qgaHLdpk9ZQK0adZeP7Dtl0doItcOS6F1kAjvcUW88OIOI1Ixi+tUC4kQiVL8qjQEZgOhFt3RdBh
	fNUhugWSy+a8IUe9MbQ8CTfH/8m1NdUqqaTrQR0V4hh1PyhBKP3O3OXXY9STSphTihwcqKwwdiliH
	bPdz3JNQvmmxrEFzjQa/Vx+zT51v4Ja3QBjSkWIcMLdkOwZvD481FmtgJI0myRTYKSj3cDAGKkYBD
	5wgJ+EYNydjM6SKx1cFb2TGZQ8/zH2KSKdpsci2FVVG31/7pEDDaQKjoZq6pHuTo4ALb6+xIU5sY8
	I5XRnDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMA1-0000000DsLu-2eej;
	Mon, 27 Oct 2025 12:17:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDM9z-0000000DsKv-1UOK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761567434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RC0J3akmB3TXc++y+3XKXioAKP3259FgNBDBPlznVPQ=;
	b=GDHuZpywqQZi9TjaY9Zee/ZuIvYgQChKNyPrhXZDbxg7CIs4oRnHyha2uhfSAjuNjHr/2/
	DdT2INROMtV0rU9XvMnL0Nts2+TXkb4H7BXgslu486QKBo9O9yBWkSyWtPUWtpQnrsPAna
	QFJr0IfrKbO8ZxyppldQvAHTb6Ww9IM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-kxjEZOH1OdWIqcVQZyAYtg-1; Mon, 27 Oct 2025 08:17:11 -0400
X-MC-Unique: kxjEZOH1OdWIqcVQZyAYtg-1
X-Mimecast-MFC-AGG-ID: kxjEZOH1OdWIqcVQZyAYtg_1761567430
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47106720618so31662405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 05:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567430; x=1762172230;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wll0xmsacByMeT/hOTkkX96EzOS2Mn1ybFdnjeQhq3A=;
        b=oZDFdd6ABbQ0gX3u2cTo+ISemREJx4zsYv4I7fir/RT8Q2w/IVtZQwcl2XmaJI17S4
         Z6NBrEuf9vfu+qGGXCpwoRDCe3zUZnhti49WtALeySWn+4h76AoNTIyKYTJkCYr1OSlo
         /8ekVSqB0wSu+bZ7nvSvcOPxQ4eA8yShsckvok4EEZ06eisare//JUTBgDkchnVwLHeK
         XfMK9clry1BDgBvt/k1AfQ0md66yrBf489RklNLN8jMtuDuayuLCbGAjhkzHRsoXg/62
         44JDG5juG3TDYSlxW4lhfoW0WHSj/91mqGdFPb9kgSrfwnF0GqSmOFpWQCm4DgVLXOPB
         0w3A==
X-Forwarded-Encrypted: i=1; AJvYcCUzQJqXKm1gU2J7p+igYFQUUQYmVuu3gzH+rEZ/9Da0VBiMhvxBQjNQRjk0nf5PNqI29LbtpM87VBJPY3TyRr36@lists.infradead.org
X-Gm-Message-State: AOJu0YzQl+SnGdYDBsIAPRBYFW4Aoy3FJ/bJgxPn2Bd2WA3YlKhR008g
	ps5ZeGnN3ezcetGSA6bbET82AZ3+SRfMNr78LOw6Csd+7E2k1X6c8DvdlJmdgSvnLE+gYD/7cln
	Ins3oS3h6/BNRzQeuBqRhXw7ihh2tac50mC7sz57UBWzyefeg9yi3AhByXe/DmjfhZg2ACX7yHJ
	l0
X-Gm-Gg: ASbGncudd4kzFcUM13sZEUDGTrzHFtjJf1vuWa6PaZgPkEoak1aWji2WdUYY3UcGLcS
	gxVefdNvLO5DFUbUEOdEDKSZZew4BID01DbcnLeK5KEJpqVc5f8Q8/ujIK5wk0DESL3nkIHadoK
	ludTf+c89sEEsWFaKgk04EqwY24x5TShOw7bW/jGRj/fpasIoD69KA87epTGc9wO4U8uvJjCqKu
	a9Php6lhCcsU17TLkuuFZiJc9/cgWXmUuL2NHYcoz68WAdzxW0GHZcV+qLC9uGWjVbQ0n9PMEwQ
	0fnqhzN/eLvsTseIcB+t6ooG/U7C2TwPOMF7v2FGqJYMo7LRO7OGwKgdLdBioqhZnMPHdPRuyol
	8zlaKTNIpwzj9s5EO1wh5Md8LnPpEnsS9LS6Ml9BOdtCK0kIm
X-Received: by 2002:a05:600c:a02:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-475d2c2ffaemr87848395e9.0.1761567429921;
        Mon, 27 Oct 2025 05:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Kt+sgYwnqm/Q4piYTRL+0NmhLKf29X3f9k3CyMYQpSiUpxteFuRbA1s4pQkL/YU8wr6E4Q==
X-Received: by 2002:a05:600c:a02:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-475d2c2ffaemr87848105e9.0.1761567429402;
        Mon, 27 Oct 2025 05:17:09 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de. [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dcbd243csm65775805e9.0.2025.10.27.05.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:17:09 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:17:07 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
cc: "maz@kernel.org" <maz@kernel.org>, 
    "oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
    "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
    Suzuki Poulose <Suzuki.Poulose@arm.com>, nd <nd@arm.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "will@kernel.org" <will@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>
Subject: Re: Failing no-vgic-v3 test
In-Reply-To: <985e9c0d9079ea2a27114a8b088ddf10482e1f37.camel@arm.com>
Message-ID: <ae15bf83-df34-59a3-712e-6102bec59801@redhat.com>
References: <f9c7fffa-53ba-a506-b48b-07e3df2d1d5a@redhat.com> <985e9c0d9079ea2a27114a8b088ddf10482e1f37.camel@arm.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pt1Eafed8zOssdijJPn1dQpi_3MTFo5hlws5XkxD3Ro_1761567430
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="-1463806286-1316213544-1761567429=:13240"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_051715_469290_2B91D32A 
X-CRM114-Status: GOOD (  14.87  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-1316213544-1761567429=:13240
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 27 Oct 2025, Sascha Bischoff wrote:
> On Mon, 2025-10-27 at 12:37 +0100, Sebastian Ott wrote:
>> on an ampere altra I've got a sad selftest:
>>
>> [root@virtlab-arm11 kvm]# ./arm64/no-vgic-v3
>> Random seed: 0x6b8b4567
>> ==== Test Assertion Failure ====
>>    arm64/no-vgic-v3.c:66: handled
>>    pid=3793 tid=3793 errno=4 - Interrupted system call
>>       1  0x0000000000402feb: test_run_vcpu at no-vgic-v3.c:128
>>       2  0x000000000040214f: test_guest_no_gicv3 at no-vgic-v3.c:155
>> (discriminator 17)
>>       3   (inlined by) main at no-vgic-v3.c:174 (discriminator 17)
>>       4  0x0000ffff873eb587: ?? ??:0
>>       5  0x0000ffff873eb65f: ?? ??:0
>>       6  0x00000000004022af: _start at ??:?
>>    ICC_PMR_EL1 no read trap
>>
>> This is a guest without VGICv3 on GICv3 HW. The test expects UNDEF on
>> reg
>> access - which is not happening since:
>>
>> 3193287ddffb KVM: arm64: gic-v3: Only set ICH_HCR traps for v2-on-v3
>> or v3 guests
>>
> I posted a fix for that the other day:
>
> https://lore.kernel.org/all/20251021094358.1963807-1-sascha.bischoff@arm.com/
>
> Could you please try the fix and confirm if it works for you?
>

Yes, that did the trick - thanks!
Sebastian
---1463806286-1316213544-1761567429=:13240--


