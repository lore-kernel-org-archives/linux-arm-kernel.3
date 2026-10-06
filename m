Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6F4CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHj1RXYmclP68lBct4KNIr5BPd6z8PeEquooINbDID8=; b=UgyL7jkOTQDW8z7sXS2SQEJWoK
	PLusZT9EsDUNGh0HSMwnDsVyzFpuGx8AH+H/roL1JCy68k65ETiquRbreuMWbZtqmNu4CuGxROjup
	Z8d7Pl0HwGqE3uGuUHqPZz7DyFgiPMWEZTluCQ+oVcAnbD5xTivUwl0Va+gofR8tsdvDtW54S2++j
	RrbQJj06P39Abfw3gJCN5Am7466YW1LHHyY2L1wCcmvVfnxFnxYOW8dU+AnVhE8GUJssMNyyZX54P
	JK1QGMjWPdzrirYjJpr1KaeqRmTJ19oSgLHxKqLQrMxHNsdKXA+tq0Ej73ycvr9flq1TcVlP6jGI+
	pgoAn18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvbB-0000000HY9S-2DNG;
	Tue, 06 Oct 2026 03:12:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvb8-0000000HY8x-481d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHj1RXYmclP68lBct4KNIr5BPd6z8PeEquooINbDID8=;
	b=L102RUeGzVNINNC5Gsrw4AWaBjhFHve2mcymjKz1tROfX/rf0DzoFOKoWT7Kanb9lvK0Vy
	KEJrU5/3X03v2P+//9cQn1GcQEVtwqiFNndWPK2rUd15DU39CCKyhGvHmlKX/u5YncKDyY
	5O81NeOjJgaO23Eq29dzn+dKNrrhSSs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-mER8q74kOGuCOnqLYd5N_Q-1; Mon, 05 Oct 2026 23:12:08 -0400
X-MC-Unique: mER8q74kOGuCOnqLYd5N_Q-1
X-Mimecast-MFC-AGG-ID: mER8q74kOGuCOnqLYd5N_Q_1791256327
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so2361369a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256327; x=1791861127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHj1RXYmclP68lBct4KNIr5BPd6z8PeEquooINbDID8=;
        b=h9o0ZVk8Fmx7PXM+kvZqPy2feCdCgyIJlq0NsMLHbHH4m+wVAVuGQik1SUxML+uaU7
         vpEUBTK4Vn8WKbOxbAcQcrcihpW1zW7chP7jcEDu6blhfhqodBja/kqF6O72xtD+lEo2
         He83HeZducP6a98OE4a7zUacSeQ5llNO+6o4zoV+IGNuMMTsPdZwIERncjmPItCoMGaM
         YFK9z1h85LS/S+Uk5UlqiTptTNcY53rFmSUkmk0XviZY4FasMFQyRo1ksP/4/9OmDne1
         JDVYgxeCoMhxmfEembl5c0Zp0gQhvyEnaASkHsvpGIntHTxK27EZLORfClQnT3QNSVmy
         Ux+g==
X-Forwarded-Encrypted: i=1; AKwUvBzoLw0mNIka9+9Y3vbbKlUp/mK4cFTBAj+30iu7FwvA1kgs7iGClwWqg1taWlR1TKAxG1GJ34t+kSQaQFmKyUOg@lists.infradead.org
X-Gm-Message-State: AFq9FYJBDC9c1ll5kd4JjsWOeTF6ua3H2w0wxklPeXcP4sEa4SqJMQKt
	KWo0QT5AAbE65OZxmmleypeKf3XpIjRdeebk55KOhiPdNR6AFksKS1tGKFsA50xFTNDwbQqi8Cv
	QTuSjlZiuhGdp1dxVZ3wIv+KZerh99cG27navvAxAwvyHj5/5PnQVBN2VWfsfXo+DuqKW4Nxgw2
	fH
X-Gm-Gg: AYBFou0fXPDCgbgl6gkV96RdpK3vNstwQG7XD0HS+sVeKRC+Qlri34HL2FzvJpZwcvR
	u/2cVH2ieuGzPPu7p2I7w/gJFcC12+eFanwxnUP1IODUmDroB4T72gsTmT5e2DEN/kA+TFykgN5
	t6bdFLDRLLKzKC9AX85RmrFyWOKBdZp3M6MeAVVdsCrN96xJr0+hE9PHW/OWivEqGDGXhcycern
	Vqzf3UKLPwSBXubdo4dO3k3N+FUVrY2vzCVNaXSyQDBX2a9vv6tH54B1jQXDsCRKRAkpd+0pBEc
	XOPHCuD7k8fGd3XRx1MG3c80nsWhSOFn4fJ2Vvo/8mMMvzz3cXhoVZsqF1n19oiBo7ApaGBfu8I
	3uCFQz517zdvLqolSlKwfuezIGS9aBhQkTHYRPsEXKw==
X-Received: by 2002:a17:90b:2e0b:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3a8737a34cdmr26438a91.63.1791256327294;
        Mon, 05 Oct 2026 20:12:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3a8737a34cdmr26405a91.63.1791256326616;
        Mon, 05 Oct 2026 20:12:06 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ee97f3sm15210795ad.66.2026.10.05.20.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:12:06 -0700 (PDT)
Message-ID: <6d290cbf-5dee-40ff-9ca9-af544fdee791@redhat.com>
Date: Tue, 6 Oct 2026 13:11:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 15/23] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-16-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-16-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kNFrfG9IaG1ScKcMo7h-XuxsgSgCnRBYa-jDUSHPIws_1791256327
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_201211_121087_90803781 
X-CRM114-Status: UNSURE (   9.17  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add an explicit mode to support Arm CCA guests.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>   arch/arm64/include/asm/kvm_host.h               | 1 +
>   arch/arm64/kvm/arm.c                            | 5 +++++
>   3 files changed, 9 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


