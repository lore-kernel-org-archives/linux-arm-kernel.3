Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3C7CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc0k+BB+B+pR9YWQ1iPcOnfiXQnv9hmfa3Jo581awKM=; b=bCBLcNTw/p652pSV5aFWR5oMfB
	fc63hIUvP0FQy8gkrG1RTZRTuE6hAD9CFYoAU6Oi3PbhGR+MlthJiXsUz1q5iatNiaHxhwvlbVgQv
	4/X846Et+zM8bGaKAruxY4S0JMJ/IwUlkH6n9GbQYHucRbAqSSCPkh7xslUyg3Dy/lnERFN3Jma5T
	xYhL5W/ExIw933yGNEBhQ3153IzkPnsQBXA3sPAbJRTmvj/rMN65rTDXQBzfIHwU0Ehw2evG+WGOB
	C6dIEP0RXofCiYfmX+gar51A61yoQ4MMdRUfl7/7SUk9EdEDQ1EDhkkG6DKLF4jikEI3mvA8oBsdR
	kRpRSprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBK2g-00000001nCm-2uBS;
	Mon, 28 Sep 2026 22:41:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBK2e-00000001nBv-1YiN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:41:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SLTY6L1282892
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 22:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lc0k+BB+B+pR9YWQ1iPcOnfiXQnv9hmfa3Jo581awKM=; b=ey0VdUVhTiQujIvu
	rGOGRtg+9yJrmlcbf6Hr5HkLn11O5bp17i7/sX4iSRzZ0+jo9q6CHcogLe/AbW7Y
	YBDGBKgqvxLsuaJaTiGaSi/2BF7AI3Q5y7EmQJQ03N4JkCHVRDkNLbFOTF/vnE1a
	l1A1jz7V85ITb8dqyS18HxGllsQOwBscxmCaYZsWjbJckw5MSyqJy/XRbbSm+zjb
	gReSYLUqJEIaGye2KK2IrV+RukChEpEPE1yJoi9P8kcn/R3rY9dyLX9g1Gx+rGrz
	RqQ2x3uFs/VocJJ0DFcYNImWhNg8XAK4wer8zM8A2umryL5K/gsJMkC9psn8vfYD
	5HtOTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx3ajjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 22:41:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5977073eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 15:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790635307; x=1791240107; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lc0k+BB+B+pR9YWQ1iPcOnfiXQnv9hmfa3Jo581awKM=;
        b=FC7g0SkrTStGxkZ/wMwXPaCb+ddIAVm1WxwVqPYEYF0gOg+Dk8I1feq+mRVxwBkYlg
         55A6EFin/SySB1A+q7bbuOVNZqSp06TbunDAxbHRhjUwmX5bjjzOBFAU7yyd7N8p8Ij/
         //T4QXi9tSRgswe72155qmNwRN6L/dztzUE/dekwboLtpyCZzUfxV8QDIrZxvZ09RBe0
         /gtGP7MXjZoew0VkOcXxtO02r1/S174PhN3MymqkwnxRtrwClY6KZO1l/UU2ORwkcs4L
         BM/S1kOzlNPsjdnf4tOSG5HnLAinfupfZ09lLp2Mb7mRqcE+jFn37N5PZB1AVE0gl5WQ
         ZFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790635307; x=1791240107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lc0k+BB+B+pR9YWQ1iPcOnfiXQnv9hmfa3Jo581awKM=;
        b=ID60Ka6TDqrfa3VCylYmQ47IrVcxC70Lp+XUknTVq9cfgJJCLRlNOL/ck9YlTz3nKf
         bQhKYTJgCAToG96mUhy0wVF2LO3B16Koink09inq1ks0ESd8h1eei0EUZvuvPT4bWji0
         YzTUG8O3Q5d+Y5lsoGB/Bi2YOKwbVY9IZDs3YF5AYL3yrWxCh/ShmEgoqFgFPEVcLS0F
         jvbWpTvEtRBFi8MeK1jPh3u+9xSqdjfizkAniyi/t7loFHxqmGeNWQzNbkCooJwcXffR
         5dszs7jK94ZmykiN1v7BQVnALaqBE7LYpfue36gskc35OfZH+WAyKCqjfSmsTYn8ceB1
         q7NA==
X-Forwarded-Encrypted: i=1; AKwUvBwP8R78veG1iyfMEaOCAWC7rKO0HOU3JTyKOQ3hnwzAKekUh3roiaay+CA3G30idyV9AqN0a5b+qWQ0aAuFsD5C@lists.infradead.org
X-Gm-Message-State: AFq9FYIGodumqSbphNQc2XmqzE8e64lmPYk03UBvsgQWGVmuBQ2c96iE
	b/6UbB1L0kMa+a42Lpm+vUUaBziXA5p4mYi1WtTpPJijVCemYu1gdH61hemL2xNXitFT1Em0lOw
	FuWyms08jjUVyYMnSEp0kBeNUrjuyu2BUCCB7NADhveecBJ7SmT9ahXJ4E7yhg5Jd08+e+JyXUC
	LoAg==
X-Gm-Gg: AYBFou0j1ReQnrJeV6eEY+ElgT3sl2qVgHD29U4dUbV602QcZcrkCkVpfVZOKE8LCzL
	qUirLeEzmFVdjGcsF9JoiJYuH7fUAEz2uRbHMjS/jD04ipRSxPnh1Ex8X1vKvwvgmDnsrUOQ1kf
	bpLnGVOucv53c12pcexR6ru2LRb9MZoGuvq/pGxTunTMhmXs5xo7g8AcG2i2ACIqfl8Ji9WOBUA
	s2tMtYdtqGAWs6My74uO9tMNNhEMIYsp8b2hz8SoLqWwUP2PM1VACczxlLoC/eXI5tjgATDchCu
	vjRVt0rexLmfJ2CziEtn34FPkOyh2ricPVCL4gSu9OcOaw3zl8JnibUglI5AUbazmGTQe/ow0fT
	mfDulSEuRWJ4BKALu7RRBy7XOX+jnNg80AnIjag6v+kY+tu0UV0+iS8ciD9gMGSU=
X-Received: by 2002:a05:7301:6781:b0:341:a4ed:d910 with SMTP id 5a478bee46e88-3426fcc826cmr14033361eec.7.1790635306810;
        Mon, 28 Sep 2026 15:41:46 -0700 (PDT)
X-Received: by 2002:a05:7301:6781:b0:341:a4ed:d910 with SMTP id 5a478bee46e88-3426fcc826cmr14033328eec.7.1790635306198;
        Mon, 28 Sep 2026 15:41:46 -0700 (PDT)
Received: from [10.71.40.138] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm29893248eec.24.2026.09.28.15.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 15:41:45 -0700 (PDT)
Message-ID: <db2e1a67-4b15-4bec-ab08-1a22457b52ba@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:41:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: dwxgmac2: enable L2 split header support
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
References: <20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com>
 <aro7Yijt_d-KRD0Y@lore-desk>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <aro7Yijt_d-KRD0Y@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA5MCBTYWx0ZWRfX/UsKslPhKoy2
 7J+WF/1px1a/JIXD5pUz9QyuH3B9rV52GOYsDPeg3COqOIYIq53GNwOsKXurITgQF9GyfINfEQe
 AB3aFzCcaz0zkEoZk7XGJ3u3IPKQ+vu7dGPhF6A99Bj/zelhXEu0Io74l8QQKe24bzKxZ+Q0LM9
 1bXRH4KPe+W5l/45f2iAOhZ13m1koXKg8Gnx99K6qEwT6oKAp5ROiOA8TC+Twf/iKQuDURxjwX6
 9HmiHs1W7AbqAL7iaOwhfPVYTmXWgSenjNjtUw/AtkD1PjYsf4hrbk0bh5lbm6ANfbp+P1Z9+V1
 QeYJwzJ9RsEsosxcKFf/UMADUYWzma8eUNk+ULyJwNie0zdejnr3qf1aQXSOey0KY2EnDd9LGC/
 00radxfFjt9FrEgSVdCdiumnyEeoPVSvWHwyL5g1GlibjOh+mcfh1Drkjo7B4N2D9dKEibBgMDK
 YYJzgBSSP2YsxAKPVDg==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6abaed2b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IMd6QsT5PRD0yrB2h3IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Hxxa7V48wYVJjU_d4ueYvODJl0eufXZj
X-Proofpoint-GUID: Hxxa7V48wYVJjU_d4ueYvODJl0eufXZj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA5MCBTYWx0ZWRfX8gZwOutZ/n2c
 sZ+bUcV24vp/bqCHcRxCIxPXbHPSJg/jeurfB4Swa4XEWGC3XG52ussFqYDhm72pX47MxFgaJA4
 J5HcZ1+GgzDAuGXKdTl3mnVwCORh/tI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_154148_423808_BF22B36C 
X-CRM114-Status: GOOD (  20.59  )
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

Hi Lorenzo,

Thanks for the review.

> Hi Sagar,
>
> are we missing to set dma_cap->sphen for dwxgmac2?

No, that's already set — dwxgmac2_dma.c reads it from the HW_FEATURE1
register (dma_cap->sphen = (hw_cap & XGMAC_HWFEAT_SPHEN) >> 17;),
predates this patch and is unrelated to the sequence added here.

> +#define XGMAC_EXT_CFG0_VPRE		BIT(8)
> +#define XGMAC_EXT_CFG1			0x00000144
> +#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
> +#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(GENMASK(9, 8), v)
> I guess it would be better to define a mask for XGMAC_CONFIG1_SPLM.

Agreed, will send a v2 with:
    #define XGMAC_CONFIG1_SPLM_MASK        GENMASK(9, 8)
    #define XGMAC_CONFIG1_SPLM(v)        FIELD_PREP(XGMAC_CONFIG1_SPLM_MASK, v)

> +
> +	/* when FD=1 and LD=0, HL is RDES2[9:0] */
> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
> +		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> If XGMAC_RDES3_L34T is not defined on non-last descriptor, is it fine to use it
> here? IIUC XGMAC_RDES2_HL depends on XGMAC_RDES3_L34T, right?

The data book has the following table for this (Header Length
Availability in RDES2):
    Value of FD   Value of LD   Header Length (HL) Availability in RDES2
    0             1             HL not available
    1             0             HL is [9:0]
    1             1             - IP packets, HL is [9:0]
                                 - Non-IP packets, HL is [9:2]

So when FD=1,LD=0 the full RDES2[9:0] is valid regardless of packet
type; the L34T/L2T-gated split only applies when FD=1,LD=1
(single-descriptor packet). So the non-last-descriptor branch
deliberately doesn't consult L34T at all. This function is also only
ever called on the first descriptor (dwxgmac2_get_rx_header_len() is
invoked from stmmac_rx_buf1_len() only when len == 0), so that
precondition holds at the call site too.

Will send v2 with the SPLM mask fix.

>> +		return;
>> +	}
>> +
>> +	if (rdes3 & XGMAC_RDES3_L34T)
>>  		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
>> +	else if (rdes3 & XGMAC_RDES3_L2T)
>> +		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
>>  }
>>  

Regards,
Sagar


