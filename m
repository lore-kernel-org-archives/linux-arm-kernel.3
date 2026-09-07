Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E30EC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIU4zOAVyaWw3Nr0469yP5bWwVOdg7LcRfJkt1TSBCM=; b=xl7sPoQCDMiACGAJtHvaCkUIpi
	i9/4z+17QltescJpZ0KHhfyI1AN/g+quRGThC98zg25oeY5tOsEeotkODrXlMt1ZBD9UScIUskuUt
	8HdYDmnbY58utOM+yMNHuS0+bqyVa6Od77sSSM3suGINgl19QgZXF/ALqkFBbJyh3ovpFmEkVqR0R
	QAY68eKBXBDPe9hddA/s6nTX+qY3Y0G36aILTsNwuFlFakZg7PeX2vLzkFOEHRSqR+ll94HdOoSTx
	iJ71//cWx/nQn55e+Gxum9TY1nLRB7r/haK1kUB4jRerP8jQl78ITcLaqsAV4frm2a3kuCen14WQE
	PrxJwjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fqi-00000007gon-3TfD;
	Mon, 07 Sep 2026 20:21:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fqf-00000007goO-2U1K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:21:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7paX415016
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RIU4zOAVyaWw3Nr0469yP5bW
	wVOdg7LcRfJkt1TSBCM=; b=AmXYi8h5t8GxfErVP1Ku6oarBph+vUrmhP78J1Xv
	EbUON9NW+WQkE5BuBP1F20Dkk8/GvH9tgL+3u17RxJhVTuuCfhvgiVLMTdP2CsBH
	4KgepnguyYROoKBSpzCgGKeyuxqRSLnBQ8fbJ0pQmFDamN1jm76ywNow+3vU5LOF
	4VVUWziLNGPEnLTK2//yVSe24TXTXug2HE/j03cYJUnCgP+aH3VkLfMSQLkPePVD
	1ugKGrDh/5G2uyfXdw4+mMakgoyQ9i6yczDXVbPEeZast208KFUFEsRkQQwXGsPk
	Q2Uyg5unh3dYCLyq6TzqhzsxVgMSyNzeirFE0igpJeNlIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyjjjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:21:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93771aa0379so761395385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812508; x=1789417308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RIU4zOAVyaWw3Nr0469yP5bWwVOdg7LcRfJkt1TSBCM=;
        b=bmz+BgrVlgb2R15NjQ9+UN7mOnjRutd0Jk43GhSpXyGd8/jKjKr5jMNpmLeWEDpdJ1
         GX18Ilhz6T8ak7dPO3ixQi04TregxgQdQt7ghSFFZHWeduo5H7+65i3iskwdXT89z+XE
         x9W5JrI8/jMbf/6id3Xz/fkjsn8Gw98FupDmjTsE8/vr9k3Dgg2ultxva4rUbg5HR8lT
         //Z1K/gEOqtFboLKSCyXciifi0diPkuGW+tCBH94B+/CWeWhKbnz/1z9tlVbFDMuorUK
         fGd5tIP6heg17nkoyjA6q6tooBzS+00TM1rqGrZkM5CH7oKMcqvcDPpNrCqbaGqZIjK8
         IEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812508; x=1789417308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIU4zOAVyaWw3Nr0469yP5bWwVOdg7LcRfJkt1TSBCM=;
        b=OMv1BlhgI8P/4Y5isP2pDZRTlxuGvijo/Zb4H15nOKaCk0YZSPMJiQFVdwoZBfhSHd
         b7sL8Us1LPK1YaMRrJHk5+o2CZEasP/rOPt5P59i+VJbDD3wCxck6PtRZRsa9B7vUxm+
         4wJGeMbdp+61AbLzCeEvFUbM10uUzNODeW/okil937FZL/PIJuVPHlCr0LVstd5i6yab
         PU4BlG1wpD2r1SxF5/SbdR7Mpmgu78dycha/ZH/Uj9aNdKctEcZa3Wd+azrMLTcMkV7+
         xsdUaa3MFejpyTa0NwlzoQ7j5+r3a96O+fa+Ao8sIogthZY1sbW6z+FiulzTSIcvg9Z1
         xEow==
X-Gm-Message-State: AFuF++mB2gvLatTNVAlPpfB2B6fQWRPwQWfHI+1z17aH3HmrO7Kv0X8R
	m/W3+8eNAOvXOyPngC9u2jfOIUu0WSZF9GHGCL2gF6iSL/ALgD36E5iBj7u3vxP3c+7jb8QoQRQ
	GyEgPcWP/a2hyKU+rTMJHI0s8rRtZ5NvFK5PbGN7Tu97wZPsXpL12DJ1ozQEIFIRo+Rj1GIOUcm
	vyVg==
X-Gm-Gg: AYBFou2NyUD1PqRhG6l1DTgy2QUs2rpznMC3+L54MNKj9hHI6v/JWtqcbY2ad0D7GF2
	RPJgni+1F1+JOvyG76o4yw0jPOcTUP35wXeHkHcuvhli8ehFP8mtNjmVQ2W6KHt4NfJrNzovukf
	yTBDSFeE4WrsPQQIPbmBsez6rpHZovZJ7NDu5t+bcX+JXhdPl0oF7TsUu1p76rqJcBT9Cte9j/W
	I+Qh8MfFwujpMHdT7SD9PjJA3XrIfvUfO+gR14+vCZSlBdWALf2h83LcsyEP1qOxBH3Ul5roMpv
	EJCs8GPUzb5bcmmsNiImp0OGjiHt3wtoRGf6D+GTLHiGWnLGj/mBKy201fqEMFMd+eXarXfOyuv
	Ef8wN0u+gEwn06Q==
X-Received: by 2002:a05:620a:27d0:b0:936:df48:d507 with SMTP id af79cd13be357-9398033d1aamr3046261585a.18.1788812507608;
        Mon, 07 Sep 2026 13:21:47 -0700 (PDT)
X-Received: by 2002:a05:620a:27d0:b0:936:df48:d507 with SMTP id af79cd13be357-9398033d1aamr3046258085a.18.1788812507018;
        Mon, 07 Sep 2026 13:21:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm23868781f8f.11.2026.09.07.13.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:21:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 23:21:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
Message-ID: <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
References: <20260907171729.1735641-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907171729.1735641-1-maz@kernel.org>
X-Proofpoint-ORIG-GUID: mB6w3FzVL4tkPPT_YlDH15a15i7kK_kC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX2ki3qUJJ5hPs
 yXgzFPCcrJSsipc6VHbJ+K1xLqABsSsKlyVHfGmpoqJMBjEOYOEwwSYMzeoXAwq84IxSRhHSF6B
 ZCvT7DCNrcYHX7WclgAAULdiRY6XsbXyEZahWr9DqlmzIv9wuPBpS5W+vJcrULjzJfp2NBrA3e7
 Qzadu6MGZyujG9uB3lyH8Adkhu+ZH7eOEfnvvfC/9EJBOpWxLGp/DntSCkhe8vM224BeqeBQKjW
 v/u45G4fRykL6A3/WH3mp4P7zAOr0o8y1sb8ZjhRz33hfhygPIOhrbpTd01wabnPGfOGNAumHY5
 MVVtjvwVo9ilywzCgBGqwPuTxDWy7JNBP5GOysQKRRh0HXdF9OJpErodmd5b5HKtuY6XcdK4Hil
 Tq8kPWkuvZwhtITACGGgBMUFKdoJPpQO3V0U3HI73FFkU+p/Gkl5eJ3hL5xO+kSFvxZnINR0d4U
 8dd1X6zV0+WilwWYdmw==
X-Proofpoint-GUID: mB6w3FzVL4tkPPT_YlDH15a15i7kK_kC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX7vtWlp6aVnG0
 JzGIvLbfVJK+I2OgvBY6n/jLcJo3GuBzyOudWU9HnKeqlI5m4TX86fqLxqrIJZYtKt22TYtlPgc
 mjBB5WpQn9TFC5U8oBKK3qXuXTzrz0k=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9f1cdc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=L658MKht6wu_f2CE9M8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132149_786196_B853D6FE 
X-CRM114-Status: GOOD (  14.67  )
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

On 26-09-07 18:17:29, Marc Zyngier wrote:
> Recent addition of QoS configuration to the X1 variants resulted in
> systems that spontaneously reset at boot time or under load.
> 
> Given that this is both very unpleasant and hard to debug, give the
> affected user the option to survive such event with a module parameter.
> 
> Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
> offending QoS setup.
> 

Lets not start doing this, please.

Can we figure out which platform deosn't work and then maybe we can 
add a quirk in DT per platform?

