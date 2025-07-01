Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F33BC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQYfrw2czgfVr+YerX7siCfmJocpn7Zqz18UhcgAHpo=; b=rl6UPlarJNzlJBFvZLhx7Nm5Jy
	CFKEDBcftyFVMRAvqpG/1IeygfPZlGXGF0cFa7ZCq/nxB1b1sfgrfkQBbEfaLA9ZbFzYYk1QrKqXL
	LYsJm1m4X+WWfq6gFpTHHniiy0NTxhzYTaSseXP5WO+dFzQ0RgSOSY27bTCT2JLtGSAqlzMvBD35h
	zkjVUgUEYIV7wqxgn/VCCE3P6rlIjhh1U2D3KCt/ytiSmJVdQdz1fOrhRHE76ApUUGmup+/LlqFow
	a+Jt22gy0U7v8xPmrTIPEKjYJ4hSNktiqU7t+2DF4Mngr7yghrf9tBpFdFXRJdEGQdj3MmvWODus2
	E3ZW6mxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVLm-00000004GPC-1Kda;
	Tue, 01 Jul 2025 07:24:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUgZ-00000004B4m-1ecX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751352102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQYfrw2czgfVr+YerX7siCfmJocpn7Zqz18UhcgAHpo=;
	b=hxOoqMLcIVT1HQARS0yN6JLq1PINIlxGxo8olS8g7ndhsiMbe7CuboDjpU8ivRHZSP+a66
	3CnCH2l0FdvsZUt33BwI35th4KEBvKAennJQFuSeCnlKj4wZAlD+H6BiGjULNqJqiBe6UB
	hH4wKyxWfvuB5sb9IqN8wApCfLUG634=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-d9XxInznN_yLvzkz2Nrh7g-1; Tue, 01 Jul 2025 02:41:41 -0400
X-MC-Unique: d9XxInznN_yLvzkz2Nrh7g-1
X-Mimecast-MFC-AGG-ID: d9XxInznN_yLvzkz2Nrh7g_1751352100
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2363bb41664so39557895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 23:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352100; x=1751956900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQYfrw2czgfVr+YerX7siCfmJocpn7Zqz18UhcgAHpo=;
        b=bqTjRR+cRoI+OjMyIVsOji4xw2/xw3ldJKJzMOHKBh5ZaEBzBVA6nyVb9iIqXnbdSJ
         Kfy+deOUThIkyFmFEFJP3yhoYjeMlxTHEdxn9T3n87nVRO9Hpj7w0A7pulsWBjQ9eOGU
         cUg8hGTrrtGinerJmwXIv0njGU2QqUxXtuuFbDum6kkRosbnk5Izq9yEREopbn1B6sXb
         7LA3SMZl8Cc/dFbyOufRfo4LvbLPGyP0WAJFKZDF6SEXymDMFg8ls5KVNEmaA7zfHe24
         0SZnJocfUzznkWq9XmN8DqMGuvqHIKYVXaMi2wOrQHTdjd8wHoOn4m+7Un7Z5OqH6BDQ
         MtMg==
X-Forwarded-Encrypted: i=1; AJvYcCV8X6xQxLfAtDMYlCXH6yKd/6Zqk4SRcp+EVf8CHSHvHyCwrZQmOVhknhnPNhl4NsVHp3DFQq8Ur8pVw50KsKCj@lists.infradead.org
X-Gm-Message-State: AOJu0YyRZqDtE6w3yIToSMAF/MUEFi4KMzmM7lUSiRju7I1Z+8zG0Vr+
	3iHYJIy01tKVjh2BAD5zkQY3iwK4s/ZX5T/lssManEUMWXsLISY/70UihI5LKjYAv6QDU9lEnfB
	NHljRsieFDdaCZ1vs/wXgaZI9eE5FeyQoXOV3fvJIizMgAZ7xaFIcRG3oGsWTdGSx798wiWIl4M
	WY
X-Gm-Gg: ASbGncsQx5BEfCwneJxVoh9uEJufdj/PmASRJSAIH0oMJGH9+GpbWi/W5fR36xBRr2l
	/fY2GtDfGzXOf69hEGp4o4g+UNXlozMDl5RaeXwhBmzHPPSkOLFHfW3DeAkiYIkeyOJx9cTHN70
	fEMbfqIj93fVzKqzzMdOR/PSD5EXJNXYWBb+ZYxpxmAZVcVTTqtw/ZejFC5SCsUin2gLYVo6drC
	PNU67AnURl6g6hXdiyh/EfIVla/RPE7ObhTk90+g0LXFiAnPWdwbWWTl1OH4C/iWBm26k3vd9VT
	F7mlwgwYOOrSdNOk7vpktdmM6Fxm0xrz0okaXJiqN56WzyZMvf5U08U37IUjDw==
X-Received: by 2002:a17:903:19c6:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23b354ccb5fmr48817295ad.13.1751352100093;
        Mon, 30 Jun 2025 23:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzRrkg75jFwfmHGPour3us0gMVNM40EjoGoGZlYrZyd2YrJY+nKplS2aGywWS1wb1p46z/mQ==
X-Received: by 2002:a17:903:19c6:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23b354ccb5fmr48816855ad.13.1751352099716;
        Mon, 30 Jun 2025 23:41:39 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1b3esm96630595ad.35.2025.06.30.23.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 23:41:39 -0700 (PDT)
Message-ID: <5930a931-b809-497d-8eb2-076570738ef7@redhat.com>
Date: Tue, 1 Jul 2025 16:41:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/43] arm64: RME: Support for the VGIC in realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-14-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-14-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FkL5sKef_apLMASnwmGHqhz2mUOM7rKGV3jGfsgSm2U_1751352100
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_234143_526686_5FEC1D67 
X-CRM114-Status: GOOD (  12.50  )
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

On 6/11/25 8:48 PM, Steven Price wrote:
> The RMM provides emulation of a VGIC to the realm guest but delegates
> much of the handling to the host. Implement support in KVM for
> saving/restoring state to/from the REC structure.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v8:
>   * Propagate gicv3_hcr to from the RMM.
> Changes from v5:
>   * Handle RMM providing fewer GIC LRs than the hardware supports.
> ---
>   arch/arm64/include/asm/kvm_rme.h |  1 +
>   arch/arm64/kvm/arm.c             | 16 +++++++++--
>   arch/arm64/kvm/rme.c             |  5 ++++
>   arch/arm64/kvm/vgic/vgic-init.c  |  2 +-
>   arch/arm64/kvm/vgic/vgic-v3.c    |  6 +++-
>   arch/arm64/kvm/vgic/vgic.c       | 49 ++++++++++++++++++++++++++++++--
>   6 files changed, 72 insertions(+), 7 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


