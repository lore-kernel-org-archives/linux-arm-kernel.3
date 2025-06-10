Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05768C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcJJ1EAlVxXW8fg3TkpT3IG2yzH1IUN5iBry2fQN7Ik=; b=q8UmZK837PTo0WX0u2LLjsDR+a
	5aja7WLUjRDQR4VuSIIMJjnvLDPyDFs6YN48ETP798BfbFz9duIjeVO65b5/3KhRxWvASr/gX5bUX
	E889BTQI7oso1Ib6IwmDrILqHgXt2CQiZ23xCw3id9T3mqWkEGPpxk2L/ZsKhFgqopVWxpS3SMrvA
	Pgayfzgk3VTfev1DaMPuS7jAOw92k0cQxIamFSEhiWc+t29p3RP4a1GF3OzMDFGclup+ODb4PZ9jY
	qvL0zOtFSfIe+j6YYjE7mq9mnp1A6IlDhW3th6w5rE8Q4XO2gCln4Q8ISSCE+LM9aWSTJGOGfHq9l
	0dntsxOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0FN-00000007ASj-1v6j;
	Tue, 10 Jun 2025 14:46:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyFv-00000006ncU-0KsQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749559145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lcJJ1EAlVxXW8fg3TkpT3IG2yzH1IUN5iBry2fQN7Ik=;
	b=SA6MrzVuxL0xfwbfiCKeh0LlOo6ahyMBOWQjsMnIi44/WREpr31Gr/LOOEKvjL4QGFhMga
	eh/FISEu/7b6LULvL0qhaNvdQihWRSB/BE1/bkBH4EKUxeiuibGH+2eji6Zl16Osjrz1/f
	6M4qgbUGvfOdX39MBOGFWSYvg7/ZIvg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-QQXc_t39ML-R3nSssJy15A-1; Tue, 10 Jun 2025 08:39:01 -0400
X-MC-Unique: QQXc_t39ML-R3nSssJy15A-1
X-Mimecast-MFC-AGG-ID: QQXc_t39ML-R3nSssJy15A_1749559141
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso33319645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559140; x=1750163940;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcJJ1EAlVxXW8fg3TkpT3IG2yzH1IUN5iBry2fQN7Ik=;
        b=D64uUfrtTPg+Z9HVBTxX7LKlzuuLZe2/Q4cgtaakTsXa1nDVK/d5Yq5vVdjRJqki7s
         deU9eLMQvXGUUS+jbvnL1hcI8UFPEMAtmBloYePhq4MVT/NYAIkaOuIDpFsKvhruC+yN
         NTKAjf9x5cbJOSk1CAwcJVdfzv0fRLxu7MUEeSmMDsWQ9DhkwCkkvfdmAmpchIrjWdM1
         CNPWCj6/kGnfduWmsGq7HMy1fkR13g30R2Gsxp2aTVUdvU7MYoLl6xbU8q3bMa2PErg8
         J0Nie/GhpHwj7CSZ1ZVHjHjMrE8TWM6vJQb4vleQ/qGsFTXuOyVTpCUsSwm/8SoXxL/Q
         /RJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK7HwiUqVnhrcKyFebWvWi1g5hPRR1PDCwBz/TypiQ3BxTUBrsonytSTvCbCKk9CYift4npbCY7MdMvg0Q/KyW@lists.infradead.org
X-Gm-Message-State: AOJu0YyIhRugA7UWXF7bG6H3w7jZlZJEVz74qL8bPFXpnP1jrbuLXxbI
	mvQesnhqG0wJ/RdVwBvgEF75kMgjRNhLJIHiC6oU40MmR4NozQsaSrBGNDCRvahxC2VnSJfSuwp
	+T/raKKEhHbGqI+/W2PHAbKU8rO+XdDe+Zgvw/nw4y6SnOtJfAtRZDAbCKz54746hTMBGyMWMAc
	tj
X-Gm-Gg: ASbGncvfn0OZYFxHib72uoKrtPapCgsG7dSCnB5UPFT8/X+eKWNsWB8d6TcALXQaFq7
	gaKCmZq2jk66BL1+nTuf3NbpgronCwb6aiOvtXigcpe+HxPNG63wCHPTIA7tmx03+vT4uNAFZUS
	lK54CEgfyl9w0Z2yxtv1VZujVacDgem7mI1WCFWUaxrHYwJ6paEl8QSXEjrRl1kridQoccowV9N
	tkWQ9zGQTrKPNUjXHinLh5q8EPP8zm+oBMjHXXYqkWemwua270IGnSj9jKYYqzcfR/G/+Hw1uEU
	x6CT09LIuxCucqzSOROuVFghq3KuYXYjyeZL/Res4f7WcyvbhSZCu/OOscmGc93trEtyP3c=
X-Received: by 2002:a05:6000:2389:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3a5316841c4mr14337995f8f.2.1749559140660;
        Tue, 10 Jun 2025 05:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5FTEhqSFRlt1y1mpTyIqYcFsrFo2o2s+xhYDq5+1xXUONT5D6azW2BeFCdTM+2Ty2asNG3w==
X-Received: by 2002:a05:6000:2389:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3a5316841c4mr14337967f8f.2.1749559140165;
        Tue, 10 Jun 2025 05:39:00 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe85260sm10232795e9.0.2025.06.10.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:59 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:38:58 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
    maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
    suzuki.poulose@arm.com, wanghaibin.wang@huawei.com
Subject: Re: [PATCH] KVM: arm64: selftests: Close the GIC FD in
 arch_timer_edge_cases
In-Reply-To: <20250608095402.1131-1-yuzenghui@huawei.com>
Message-ID: <e13b52c9-359e-ae64-ff15-c13acd6111ef@redhat.com>
References: <20250608095402.1131-1-yuzenghui@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yoRLXxkpojgHv8NHErqs0j1JEPJ5nYBpuIXBPjK93sA_1749559141
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053907_187109_C974B620 
X-CRM114-Status: UNSURE (   7.96  )
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

On Sun, 8 Jun 2025, Zenghui Yu wrote:

> Close the GIC FD to free the reference it holds to the VM so that we can
> correctly clean up the VM. This also gets rid of the
>
> 	"KVM: debugfs: duplicate directory 395722-4"
>
> warning when running arch_timer_edge_cases.
>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


