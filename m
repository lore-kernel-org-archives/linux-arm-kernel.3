Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E795C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=; b=pDaTGXg3B90uoAfvhplniX3Lub
	qgR5Los6Y8XZ01U3QDTw6C6t1h1FqkXYAP9sGXo7a8QPWgFTumCwLfPqSOfMjlnyuL4IAFT1ix/Rw
	24kWvt0M7igZT94xM832QuVSD9jCoDK83FDTyjccZgNz1kK1qoBRgKttvytuZbgnNUa9WqYQ+v5P+
	SwKi27gL874Azk6l/OsBUTrobbzKl1Fw+5u61az1HgfJgxf60wtj59enyaHwnULpaGAaOumznYDwh
	+XUn3iyWsWs5Gfy9nItZXJ9/zONWkvgMd8U3/Tv2UX3ZnGWKnQ3mtGr9/+hSwfaQj5DFBZ6cNQyYE
	6lQ+b3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DZ2-00000004cuy-31cm;
	Mon, 14 Sep 2026 20:46:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DYy-00000004ctx-1z4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 20:46:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJZ3kN772833
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=; b=Gg7Epvv5pxHZJIiM
	M8UM37gNuXcKbamAH2uo+QM5HBc0C1Jq/D4b8FygPYVffjNDMV9epVMbrLpgCzWr
	XRgvt8jWZNpHLkPLn53nHOdi7aXRdFbUIunfY3BARDD6wa7V8tTmYkNsFa1JTwuE
	GDey/fcoOKRLUQ+nH5jscwSH1pT8+AserRwsc/xoiYEWkiMhEMVYa2vbMsJWlOOR
	ja/eY5O5vrdaMzFZAAHL5pL4xtx1lALNufpgLZmKuCS/OizjmDaQ+kFTxj8wkhhO
	l7fvYttXqnQfqQdeEgAVGs1jNL2OknIKci5onCrL8DKK3JQoJ/lMGGyI2AFz+qgg
	0CCgyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg31yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:46:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d932ef41c4so3945565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418763; x=1790023563; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=;
        b=BFVrretji6Fegb4UlSDWkJ+io0Ujrxc3AEglmYJcXaIgetW3a6g6VWL/KFBy5slJcN
         a6R2Gm09M1Lo8z/GzYG+FFCSDZ9JtzoqZiLi4DanfeLUleeDqmcc6hZwLaEGzFh778zp
         KZjzzhKS/NfoZ55lBgCzanwhDCwFd2DhbVp9WIQ5ObLqn+lyF6ornXkOizzF3+8V1zvR
         xuWHNIh5sxbZSN3AqzbPxeEXBN5GNz1Iv0mXh3MaaL/nQ69eVzShzKsR6+uaK9eZNRsP
         XFtVPUrejGob2TuDFzk5iydNCkZhHw+USxVbTRUj/naR+Sl7tlaftsMK3aRm1GY+q+m0
         0Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418763; x=1790023563;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d07dQSvM81f3H+Zq9X/anTSWjzVG0HIsUPbekIsWJg=;
        b=nGq90U/sz2qsUt3PgEUmDtqF7gwm9sLDG8HCGhptBmhb+fS7c74uy6mOsY6EuAig3Q
         5OAkaWgVXZNNrGZaijvLJ/eqTV+JF4MQpGKd3yzf25Ct2D4y3NcQB4rwEa2LF8ADf7t4
         E4zV12iBK6VNc903WkJYrTJXfg6zQjETO+MSDKOBpHAXGGOxITPg06s1oOWUCkammELc
         eDJ0pIrWiNjeNH6eeTn2jKecPjuFovy4q5Z2jCJRyU4+5cPiRC0gjCDfbUXqvRryP4pk
         u+z7l43goZv/xurqexGUdrTVjOgYbq1d3g3Bq4vHvk3BJFhfy+2VeNFt7nGS+CT9N3KR
         TzOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmAmkfCSUiR6AzynI/vfYpSs80X+T/elSxb6iSsA/vQX9F+t2xAxkBdSqO2TEfFw1oCIVw5oKS+3xU+H1KdV5w@lists.infradead.org
X-Gm-Message-State: AFuF++mAVsJK3hRt+vP1Jj/QIRxQzdZ3uMD4whNDkABQr56H4hRmnY8g
	IUgwxQAgNOmqXO/fNhS2TgnaA6Y/zzK2t2MI3KKcvFdpNxZacUadnApxd4/2BL24R6oO0TzJihe
	szkxWcip9qtekYs+fSWxEP0gNlEx/+oh5u2shxt1jBcX0YpdJJt7m+Zl7HK7+qoAu3CT2DkJ40Z
	CmfA==
X-Gm-Gg: AYBFou09UVCfCj69xsCzsBRAqwPdvbU7dfPPDrUgYjgK3qJOiqJKYzqdugYDa6e9L7J
	NiAaegsmZRhh+Gm6n1D2u3g9vqkjsD7WrsoVfySpLHsHX8bwG8luvMt4U2KyXEcIgyaqDVMaY0k
	wNI8GbyEtBta9bDqcYJG60XAaMpAzH4QdhYaCV0JMF/QqLzeDSo7sAxkfmZio7+xc8VfjlEeIpc
	rmKp8qg47Xg7Oi3MJyqOaUEX6mVTrh1g78DlCWJthr7U8m6BLhCoUPVJGm0+KVCllHxvMgfdw8D
	FkOiYTbhZHmg2QVrAaWOEN5bxhqvFkFgs0h+WgQKkJA1jFkVl4mFLSjW40AKd/1eKQkGg64dOCw
	/SCix84KvAWzTcz77reZJe124OTk=
X-Received: by 2002:a17:903:120a:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd7655bb26mr12603185ad.21.1789418763411;
        Mon, 14 Sep 2026 13:46:03 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd7655bb26mr12602725ad.21.1789418762993;
        Mon, 14 Sep 2026 13:46:02 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bdd76abcbsm4592622eec.22.2026.09.14.13.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:46:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:45:59 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <20260914134559.00004e1b@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-4-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-4-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa85d0b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=6n8XPUQpuYwtPrU-WrUA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Qi6upS1pkaRi9o9PT2PQ3U4dKLGx207j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfXwmkX3wK053Xy
 t3HeQkgt19KPU6PQzTT6Pd0KDaVTI62vs9dY7EK6/5scxZHeC4yI9+qjWViJTc7QifK+QI68KOL
 MF/e5TXpCnakfDoIygXVXLeDP4BDp3k=
X-Proofpoint-GUID: Qi6upS1pkaRi9o9PT2PQ3U4dKLGx207j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfXwZuB02UL8Meo
 R15FrNmi8U127keftmKIWjSzFEoKvGFkm9QIgthLfd13pv72ClqcqtkOs+NO6PeBKH5RZtu1rG/
 urYVoMbscTYSn1J1VNqbBb5uhWVRZ6pwrg43ZLeWbBo64Mdd4koo7/ealbBin0tnZ7pRGkN8CE7
 /+FylXuoGr/KeoM8pm5RUzWK5LK0oYj6/wCxu9qk/u6ioXfxsSFnAZ8Lh+qKmjQLjhTXvBg5Jpk
 VR71jEHSARChkTMHfFkZ2gd5Re05obu8DemXOLP9bod7BCWUZdtP9dIy2EYUXXdllS4/3lDEExC
 5YkxMvQ+ZF3frX5g0IvGCONrXEfHeKabS4YD9tDCP3OFHaKSC0LIkLalyy1vQf96L+5Go/sRT47
 INOkaWyIun7HNSqcv016pqH3AsyXGOXqky3QKkTRQd+l8/rqQLe3OUhrbl3hQwyFMibDN2pfUYi
 hV9cas6LoKl+UCASbkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_134604_806710_5EB73B05 
X-CRM114-Status: GOOD (  23.86  )
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

On Mon, 14 Sep 2026 11:35:07 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the complete Realm Service Interface (RSI) implementation from
> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
> command helpers are also moved to include/linux so they can be shared by
> architecture code and firmware or driver code. This also keeps the
> firmware interface outside architecture code, as requested [1].
> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Moving the code makes sense and indeed that is what the patch does so
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Trivial gripe about the original code inline.

> diff --git a/arch/arm64/include/asm/rsi_cmds.h b/include/linux/arm-rsi-cmds.h
> similarity index 69%
> rename from arch/arm64/include/asm/rsi_cmds.h
> rename to include/linux/arm-rsi-cmds.h
> index c1fab41f671e..9e8a8c189ca1 100644
> --- a/arch/arm64/include/asm/rsi_cmds.h
> +++ b/include/linux/arm-rsi-cmds.h

>  
> +static inline int rsi_set_memory_range(phys_addr_t start, phys_addr_t end,
> +				       enum ripas state, unsigned long flags)
> +{
> +	unsigned long ret;
> +	phys_addr_t top;
> +
> +	while (start != end) {
> +		ret = rsi_set_addr_range_state(start, end, state, flags, &top);
> +		if (ret || top < start || top > end)

Obviously this is just code movement, but why eat the error value that
rsi_set_addr_range_state() returns? 

> +			return -EINVAL;
> +		start = top;
> +	}
> +
> +	return 0;
> +}




