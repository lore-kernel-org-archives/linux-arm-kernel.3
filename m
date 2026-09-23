Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944B6C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJmkchd5FFosOFCSNaAhYNUs9kr6IgwsEZr7XcXzpQc=; b=uFz/eKqzmM+u1qeuls6Pe7pVlI
	dNE/jPvsBrYE/69DvIPkna4Dsw5VFXedrW9BMbV4Ttkhau/uzMxMiwCNm1385klScg/CUm79aBB8Y
	MYrgYRYzMtpu9Yr9xOMOEPk/0u9bz9VcpbXY/UwOT6dKRiCaHGIfnIc+gTQ2OpnMl5BQsCxCmvKE+
	kGbWlXNI0uXxtk9mEHfEKZV4B0XZ2av2Xs5gH3QeNCAn6jCs+Aq5/TpXaefrWxR8GNmHeiKbT9P1k
	Q3oiic7anU6K/sWJLvnwMGG4pEIq+RduiFrw7EWNp9Z2uNK8A1hpTnKXaNplns/bdr1WxHO4KufoX
	quIEN4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MXY-00000008JqQ-0zoY;
	Wed, 23 Sep 2026 12:57:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MXW-00000008Jq0-1ay1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:57:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbgAl1831949
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wJmkchd5FFosOFCSNaAhYNUs
	9kr6IgwsEZr7XcXzpQc=; b=hGAYGIDPQ4nJy7/DCaS5ax7FHJcRBp8dG0Rj1gpo
	tusgnm4lFb8uqIP93OQciFk1qwolRc/LNh9Ie83Jp45It/mfT4FMwvxkyIauhFlE
	mo5IrEaKYt3/BI/epa3kUe38Yb76SEViULYxu2pbUjH0WgrNAv9nxNYU9KQ/S+BX
	ywHeGGS6rxF+Gx1wzEgsPLTOYZu9UvvyBsM65TVoRLnyYwFFy//y4mKd4P514sfW
	a6TTFHLMPhog1Q0vUSudfzNZ2VVOux08lkAlfuF9Lgse5vThpxbrffktcMLDTOvI
	yKpYyFmN+o67oVUJ6aaKHk8IIwIhwEXYPQPOOpuEd1jlfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma401p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:57:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so818544a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168253; x=1790773053; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJmkchd5FFosOFCSNaAhYNUs9kr6IgwsEZr7XcXzpQc=;
        b=Z+wwHoLq8w3gCDlMPlNq4Lwo5JNnWJY67IQrf8HVHB+WQqgIiWJKD01SBob6jz+qwu
         JnqzmkD5juH1RcP+2WLJWfnwAlGjsKsmaWO8fPw3U6nnGOLhTHZqP+A7g/POnx/QD/UX
         5h0zOChqP+AEyJpBwgSoMIg+vKmo+RB/bd4CdhOdGzmkFYEdJD1Y6OWj3j5zbto7fMZ1
         9zrYW9DPhWuhUwzZ/X3KDq79dU8Wcg9o7RDlzNRplO6rIcy+468gtPtpaGXtCeM+trmg
         IkxN19g3sHfmGs/Xzq5lWxt9xOktPiW4w8DM7a6xTCmEnQAz68ZfFzkoV1bsXwpgN8ta
         Q4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168253; x=1790773053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJmkchd5FFosOFCSNaAhYNUs9kr6IgwsEZr7XcXzpQc=;
        b=srzN4y0njYOnOXr/oX6lN1hl+ru3KcCt3pm6rS0ut3mLqhDeT4tMyBwqzKNBDeCt4+
         bqVF0iaWSAjji8FntnAYpFOpSGkYKIeuymfFpc6W5FrdeYJV+jtJ2K0WgsHCq8jcLn8F
         6T8FdtgMvIHGajpBGlr/QgK3mMbyd+nPkNjWI423DKFsJZ352f3h0iF9GOskNfCvc15I
         HIgbWKdYVltp7B1ab0LVAZgQ17/iODU5cXmVnrrIfp2L/gWt34gcqPhPVH2nDBPeLIqs
         bXq/l4LXkXsjcQQUIrIlkYcNU3TfYdzoSSAEnV7A1BS1qH8gJBS86QN901YQO+5181kf
         qPSA==
X-Forwarded-Encrypted: i=1; AKwUvBwrEiG62LnUOl0Im5C+IvPeJ0O/GrWmcMGCkwxt7n7NHNkv5uXIifPj4zFE1dfhxnI9jspPJmFcQIJuacEzEqIF@lists.infradead.org
X-Gm-Message-State: AFuF++nsR6y7qox2Y9T1JGbcVUfQfX+CfiIEcVHGQXfiCo8Ped/sBfia
	XRNpxbhMFJfXLyYHIhqpHnuhI7StNs0mAmXcb83IAQxad+R6BOVc8zsl3+J5VTD5kM03d/WnyYA
	GBRolEkMXJejqu8988LelD9+EB9WOYMPpbFQu0WIjXHKtGrGwSLbqUvnUNtRes6j82lBF1cIIKK
	1o0w==
X-Gm-Gg: AYBFou2wz+ZPrZ4hFlavYO89tIGZCYH3UGPeCwOiu46+5a5aknDIO02E0pagKHYcEoW
	yCIN0IRkFpIff7tqhrr7bZhreWUEMArSjnv8/m/FaIVTCstFq0L3hPpB0Mo5UYJX9c6PPbFQPjI
	rqIftCBmJeKnWaZMs15YvLBH+kiBufpdRTc0rOGuwrp90m5zDXsDsDGU6tqqanMLftpGn/kCbpb
	euaJjNGqKhBASwDG/k7aE3+2gSQkf41d9mrwwi8DtwfiI4MmDPAOVLP2YOe4rQOdj494rkLDvPm
	S97RS8mZNpH1rf8EX3YmjIEbOX4JS1x6fG9AD5pnLdd262oAL3ADRZHhTqga1niM63DxsCjll7z
	K3Z9Q4VqviDKd
X-Received: by 2002:a17:90b:33c9:b0:39e:6a81:f34a with SMTP id 98e67ed59e1d1-3a07e6be363mr1943562a91.36.1790168253043;
        Wed, 23 Sep 2026 05:57:33 -0700 (PDT)
X-Received: by 2002:a17:90b:33c9:b0:39e:6a81:f34a with SMTP id 98e67ed59e1d1-3a07e6be363mr1943518a91.36.1790168252430;
        Wed, 23 Sep 2026 05:57:32 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc5451sm5788341a91.7.2026.09.23.05.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:57:32 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:27:22 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 4/9] net: pcs: xpcs: add Qualcomm Nord
 platform support
Message-ID: <arPMslTgeohefnX6@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
 <b7cab76a-c2f9-472a-bdde-162e1fcb5fd0@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7cab76a-c2f9-472a-bdde-162e1fcb5fd0@lunn.ch>
X-Proofpoint-ORIG-GUID: W2uWRpHxSM31uwOT5fBgJdp1EImjJ_XM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX4h4jeO4Hxjb1
 wT9jlgSvC1ATU6M9Fyu6fpfA7DgJAnR9oP7SseR1VldJq8y5cpSR3oDTh8zvtay1iVJVbQO+n+d
 /zP4VPvQ7FM+VINCVLQSX27BMXRiqNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXzN5KF7ArWHDU
 0GR8WAxuFq2cP5zda8nfNtbf+PpW9/Jg/BZYPshobcI3k6qsUzsfEy/AcXqprQv36CtH9wuoaaY
 xnFo5wzJOfdccyvjpaTNoUPtyep76bri+3Q3j1kw+pjZGyq41NkhHyeO30nGcBSTmF/+tdqf1+G
 N8FngO6yxJDDAU5vQH8cKMgEPIsvEFZJbn2CdGwG38KuCdMht3yPYxg6mfhmQtxiAnTzgpcRf2O
 BaP0AZfD/EWZQtbMXqPawFkqJ8ifBhHJjm2UozvIf1GG3f2vd42KEmF8wQnaK0VOWGKotnEIqMH
 QCORv6aV3OovhtILc4LQRTpzDzszB5YuXlvbf1oIRaa7L+DKF6ilErcegKKC0UD12CwYn6FQ+VK
 zSnrUuG4QT38Wf4jGJYh0/nMBjVERNVTvMj2lThVGtr2Tkn/gsW2OAALabqKup7wrbXAl4phFKJ
 4qRgHpCzpTc1GisEfxw==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3ccbd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=mHhYrMsX9GfO8_TZ82YA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: W2uWRpHxSM31uwOT5fBgJdp1EImjJ_XM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_055734_422657_B3F05246 
X-CRM114-Status: GOOD (  21.34  )
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

On Wed, Sep 23, 2026 at 02:07:07PM +0200, Andrew Lunn wrote:
> On Wed, Sep 23, 2026 at 06:37:30AM +0530, Mohd Ayaan Anwar wrote:
> > Qualcomm Nord exposes the DesignWare XPCS register blocks through
> > separate direct-MMIO windows instead of the standard contiguous
> > MMD/register layout. Add accessors that translate MMD accesses to the
> > Nord windows:
> > 
> >   MMD 3 (PCS), standard registers: SR_XS at 0x0000
> 
> What does standard mean? 802.3 C45.2.3 defines registers 3.0 -
> 3.32767 as standardised. 
> 
> >   MMD 3 (PCS), vendor registers:   VR_XS at 0x2000
> 
> and 3.32768 - 3.65535 as vendor.
> 
> However, with a length of 0x2000, there is only space for 8192 of the
> standardised registers, and 0x1000 gives 4096 vendor registers.
> 
> >   MMD 1 (PMA/PMD):                  SR_PMA at 0x3000
> >   MMD 31 (VEND2), standard regs:    SR_MII at 0x4000
> 
> What do you mean by standard registers when talking about VEND2?

This is incorrect, these are non-standard VEND2 registers.

> 
> >   MMD 31 (VEND2), vendor registers: VR_MII at 0x5000
> 

Overall, it's a mess, with some registers marked as reserved, and some
not defined. I will go through the list once again and document them
properly. Thank you for the pointers, this is the first time I am
working with this IP and I have found the specific version of the
databook to be confusing.

	Ayaan

