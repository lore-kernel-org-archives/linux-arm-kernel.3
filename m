Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365C8C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XD0KIaPZUowHnH+rhCFRqX97yTDIYw3TwTQ1B3wDB2g=; b=0Bya67VCnD5NX2w3U3XoKIKWQn
	khJstmbWlX0NW0m8/NL4vZJz1/rVQ4Hku4UhDNg4Rqp/UWibFGzNNC8pp2AsX+0Ai2i904LRt/lvA
	c3Ib1rsITlVRyuRsvqruGJIUF27I5IpPw00PFroOGn4Zs/8Hp5Ot6zwJOLkY+gdbkF71bWScF7vtQ
	S1TtuCMdhez1CCSDV5BUw3vJGsv/uk8OjFxrK5BVgscSvQdTgyfRBPoioHyxvn9OX2ARiAD+TP2GO
	1qrnI8i/e36Wbxzl86Xc8ZDdmwf5xnLLhXvgNuQ7LOP4rQaQ5idfd8IEtVpM2hauJwxFfQt0rHraO
	ujNwz/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thW4n-00000000Nhu-20k6;
	Mon, 10 Feb 2025 15:52:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thW2q-00000000NHB-3Wtp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739202598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XD0KIaPZUowHnH+rhCFRqX97yTDIYw3TwTQ1B3wDB2g=;
	b=CtoRWvlFMWWc7whG5PaDPWblajSP38tosZyh0XVZ72Qkzwsf55sC6ETw9wZIj2O/T+tAj+
	1exy7WWvds/P98Se9223YHEzjVX9qoTfOmwtR6vsD366LuSz3zvk6Nv3/SkPpRhdKwmiQz
	C45qU0WYXFVvifhwR1EbuMoCIx2uxmI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-93biuIG2Pta0IrvVBuwshg-1; Mon, 10 Feb 2025 10:49:57 -0500
X-MC-Unique: 93biuIG2Pta0IrvVBuwshg-1
X-Mimecast-MFC-AGG-ID: 93biuIG2Pta0IrvVBuwshg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-439385b08d1so13309185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 07:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202596; x=1739807396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XD0KIaPZUowHnH+rhCFRqX97yTDIYw3TwTQ1B3wDB2g=;
        b=C22Wcg2OqUYbaOWEFYsTUAc8xxCiquETgKPfz1RC+UVOqaSUWXynzIK1oYoqDZ2/uR
         97hwQhTGx5idc6xyapXQXgFZYccOqL6yyEZjzVJB6H6ohaV8ErlbuWwsiNbldriV93kh
         TxvhEWjH90azaN4htm8PHqD4xZWidpDnxzOK94DoPgBFQM+EF881JgI0RD47d/7oDjbt
         tkFboEjZHp72AtSEirrJOUAfGfbd76bQh5pu5zE8C88fnOUA7KgmgMZQ3EJF6wCzjkm2
         xCGeqsf6OS4nRW3VQ7JoRY3xsrvY2SAX2ZRArt5VLN/QMXGQh59b6Z244Mfc4xEeMSGQ
         VnlA==
X-Forwarded-Encrypted: i=1; AJvYcCUmCmNU9ySmiYDHh4PgJ17fmgKcedC1Sho8IA0FfGGD3dk8RyWbPOLsHzWwjpctBIt7i+09HjDcMYpFFskvvhfo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/1mMy70Wrv9o25W8xmLmZPudu8Gh3gHTJ0IDsz+UDRP3KI2F4
	MaoQ9UYzciQdxfTu7vCUyxJKRNaiievg/q2oIn0REqIYxEBmq6Ks3WwkFfZbFATQR//LyUiYfvC
	Anw9sSME6Srcr7Vu1PiWXUShjAegR3yL8pIzmXlFeBN3ckJlgDeZekKwxV6oPzHHTsdpKuSBF
X-Gm-Gg: ASbGnct7jJbRfcVXy1P+WN04wpQKyFE2owfaoy1IpPjOEo8fwgi2+FSutIEUpqKV3Wz
	6whORr7hv6iCbVOPu7JN5k0TJWrhmpuS4Q1PAgVpn/6GfpmL9/OZy8oj0tq9lqj11S+2lMtS3kC
	odOPnb46IWwRcu+tOcBWePVMG5CD+B1NYYC2QC8n6ZKhYsIG7ku0H+/DE11iiaPOGuqIMjtEwvY
	HhreE38Bwnaarkmd/wY/+xvT38V+DrGd37eFOsaN388qoMoIAircDI+LvDhuvA/dkOLXoHaml2v
	cnaDxhDufYr+rjN6szlyLHqhMr0O2emlyuYnAP2sM9jmCTSTtqywCs8G+rtNmSd5m4U=
X-Received: by 2002:a05:600c:1e25:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-43924972ce9mr110358845e9.6.1739202595722;
        Mon, 10 Feb 2025 07:49:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOvLjTF4S/WYvn3O6o65yj9aqhnQ/dCaqnHrrF3Js86fWc5irhrJ2sZiow1ffrtpyp0aYWnQ==
X-Received: by 2002:a05:600c:1e25:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-43924972ce9mr110358615e9.6.1739202595321;
        Mon, 10 Feb 2025 07:49:55 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm153559395e9.1.2025.02.10.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:49:55 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] KVM: arm64: writable MIDR/REVIDR
Date: Mon, 10 Feb 2025 16:49:49 +0100
Message-ID: <20250210154953.27002-1-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QG3TAGRmsYr0EDkXrcYJvfzT7wYswuPgO7t0LYPuM3c_1739202596
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_075000_956898_09AC38B0 
X-CRM114-Status: UNSURE (   7.97  )
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

Based on prior discussion [1] this series allows VMMs to change
MIDR/REVIDR to enable migration between machines that differ in
these registers. Since these are used for errata handling the
errata management series [2] is a prerequisite for this one.

Note that guest access to MIDR_EL1 is not trapped.

[1] https://lore.kernel.org/kvmarm/20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com/T/#mb855bc51714095a164a7b26bb8bead1606e4b753
[2] https://lore.kernel.org/kvmarm/20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com/T/

Sebastian Ott (4):
  KVM: arm64: Allow userspace to change MIDR_EL1
  KVM: arm64: Allow userspace to change REVIDR_EL1
  KVM: arm64: Allow userspace to change AIDR_EL1
  KVM: arm64: trap guest access for REVIDR_EL1 and AIDR_EL1

 arch/arm64/include/asm/kvm_host.h |   9 ++
 arch/arm64/kvm/sys_regs.c         | 134 +++++++++++-------------------
 2 files changed, 56 insertions(+), 87 deletions(-)

-- 
2.42.0


