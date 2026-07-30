Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA32C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=; b=g8JgrKP4bL0lrwXUADtDBGrD4G
	wZiOlN52+9z1CZXjZTzj+lDY9SLXn2Ps2A5zq/Na1xYtlFXqo5cxfOGmD1HAQC/m2S4yhjUxw5LiG
	Y6syzidxNJaytv2y/NHHCOgrmEiEhGuML4dmdQ5CSjvUVZGwOWDz9TmJ62LbJ2oQL4YndNmKbrAAy
	NrIVxyaJDMDpVRcDShZS+Ri0slgM+l5cSfA2o1HXph0cWSutp/DWa+ZFeQfBO2oPu9nm2s32yDjZr
	fzg3YdNuR0Kgc6XoS3zy/OFh2Zq/9B2HHiCcrodY3oMZAe1S02EESuJCVKUTNJPHMQsD1w85qLsss
	H4uayyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSQS-0000000Ap3u-0bFu;
	Thu, 30 Jul 2026 15:12:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSQM-0000000Ap0w-3F6h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 15:11:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEeiqR1036240
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 15:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=; b=ETammhEBJePEIOBL
	OGu567lRVLym81Q5efMqukA0jnvFfzBTX6004mtp/H9Toq8h4enIwwWCH+mq+dWZ
	8DEvTjQ7XC5PBR5Fs0M/Pi3mbW0r5w/adnD2Tjje/q/2gWIDXHaGlPsgUK/O9sgf
	LKVgv3aZ1AXk/+xrKhXiCsI7Qrh2bAOnVT/xjiK9ac+/L+gri8E/KWCOFMFzf0vD
	lM9riodiFf2BODrIpRK0qaukOuGUkbCQ1zBKejFQzCQjpfvHOz7N05+ll+Vn3r6N
	XaUEQyZk7xIpRdnSfap9OzGQSC9QODDiJYjx9y7LPYhSX1YJex+7B93h2pyJn5NV
	Dp0gaw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k605na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 15:11:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so27489326d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424313; x=1786029113; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=;
        b=IQggy9RbYgwfgm6Qjmu5dNqR2DdOLzQPYsFBOHRB1/Za9F/LdmZP/fXrjgAu2Tyo1K
         72Vu3UOwYtkywV1rENjDMU/KJiq9gt1jxK2b8tyr/UXhQw4TdH5iqgjP9R4zONmsiahv
         YL5tWwvv9Teq/D9/EQHobyMvt1ymH+I2FPkb8oksGXkTO73dmH/1OlMlDSMDb2e9Gpur
         /M+Q5mRMKybE9HIqsXpn4aRUxDxZGxCgF9om9K/o08IDtN/MR6BeHvoq71yX0fbdRgtg
         5QcKWFfN3JnhTK3SwKs8T7etNdk6yKoHbl5Ds1eu3QuZtEyoQZANrrflnXivmktCrCnR
         yAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424313; x=1786029113;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=;
        b=W/WXyiV816B3TzTaGjXKLfG4cF/D1nnA1I4VyHJ21/8xiFBAn22NrcweK2uRTQtRxV
         Cccy4bdU5a7Mxo/D22pGmsKGqbJHSApsMFyK360sRYVCVLTNNnm2sLkFRUy6tWJD5HA5
         Pjw7FXdGD44j/t/Z7HdAgQoyXwr8GbsZK7mpPSIyNFebgy6ooOZAkCgwgT0jhVYb7NfW
         CJP0C3tHljv7JPVaQCu4M0mwJSRLfH66ACN+gOjNGVZviemHi5dQRj2IFbRx6ldwfqb/
         AzM0Rs6UgvGbMO0/ThPfeBiYNF74SVbAm45BDp2R+i46AxzdsuOALPuySXJVbrH/GDGS
         9/EA==
X-Forwarded-Encrypted: i=1; AHgh+RrGckahqH8iHCqC2KIauf2xjiLn8/RQE4aYsD3o3tXjSQbXTUhyrDz9hy5ift+i7GjkcCKqBv3F/dmIwM0LWbd1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3okhJEBj86hNueBiL11crmswf33rj9I0C518S/br0Tjc0oguu
	CJcw2sTg+P53XgG4GIVs6CBd4cwR07cKtlmJiiiWLdq6NZkYI0UlCb74UfkK/EkW+fOjhERH7r7
	qfhdklcqEd3XitHtT1Lokuc2C4x5S+6gSG4FfSXNF9PlFiIWHjUXbBZJqh/riltDHK8y+uvTdU/
	kZzxly38A0Dw==
X-Gm-Gg: AR+sD11/FMkB8eUpCAjts2tfxDIRHgwi3Kxw/NFtJuAG6VkrWmHf1Rit5YdAKIxsbuH
	+GOaoaPeRiTkDaOGghv7sYqkaT7ZvTEc+C3Lkp9lLY9bD3uqGBuyvkDgvQOLjl7LE+dtotyyOvP
	QGtpRNLrhAkTzSVmURFyP2WxMpzuOODkKyeFphr3Is5h2VVal3M/fPpvpcrFNgm4H6oEpYnHDme
	QrG8B47QG2c3Rbj7gSnEl2y5gz1RclNiD3cJEIifAkAIEDdVMY1Fx+s1z1l3wZ1+ivNUiAnR1EE
	zP2r4jV+7ay+1Z5CKHpsRGNC3g4Lac6aWWkVPuh/KfDB4fEZcpeldBtxMf0L14LA2mXkzBGWmDC
	wLibMutUYW6rJNfhA5SedfvSeWtU=
X-Received: by 2002:a05:622a:990:b0:51a:8c97:937c with SMTP id d75a77b69052e-52b386be0a3mr30861271cf.68.1785424312951;
        Thu, 30 Jul 2026 08:11:52 -0700 (PDT)
X-Received: by 2002:a05:622a:990:b0:51a:8c97:937c with SMTP id d75a77b69052e-52b386be0a3mr30860721cf.68.1785424312368;
        Thu, 30 Jul 2026 08:11:52 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f19bb3sm64581405e9.4.2026.07.30.08.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:11:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, bmasney@redhat.com, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95
Date: Thu, 30 Jul 2026 18:11:35 +0300
Message-ID: <178542193568.317194.16641853631837366761.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
References: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -KpjsGjd1CHVirFPsVrRMtamPTpo0eof
X-Proofpoint-ORIG-GUID: -KpjsGjd1CHVirFPsVrRMtamPTpo0eof
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b69ba cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=sMiTIix2QdjTHVfLxCsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfXx7VMV1/KwoBW
 gzFdknBx+frTaw46Y/0Dljv9hu4kj2ZpKqOScwpS0ZzgT4bbaecpTo20tsM/ni1Mx7lDFw/GSvJ
 AFwld+D51MewilFSF5iYQa8TukxUhlNdg9GblOJKziHroGyd/7rBATcTdSpKcYKVRFdfclvupHw
 r0v82LQWbnPXwwKClP5JmAY0lPjmJeqwbZjQwBLw+yhiWWQaTejiSn2SeKk7X76l5A+/qmPqcL4
 otKft3O3GEVJcafLR2wxFOVCUlfeUvTtQKIZqmJlY42piAUwjZG3F7At7NdNy12YFQlEaBj4+JR
 kfN2tsJ3b1pNLQhUTFvA/Ca84OPZY/WE+0CWStqLOck6otTE9+8NPpuBZHCCpSJ7LZrz/pGe3q5
 9ANlxgELc7kYS/qaprIp7hkasVpfonmPMgUJVLck8tkDUMI10nFhSrWkj0oRC/BAinJFHoZyu9N
 faj1V8Ru71pkdB5VhKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX72TIXT2dZ6AD
 0YLw8AM1Ww30r37FSiw/1yNcO0bUbQP2Dt+gNe+63wf2FBhWISpcarePgK7OP2qKps2WLCWxD6w
 gQrusz0z+ZWl4zu95BuIdA9puV6rErY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_081154_819955_EC523D85 
X-CRM114-Status: GOOD (  12.53  )
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


On Thu, 30 Jul 2026 17:04:47 +0800, hongxing.zhu@oss.nxp.com wrote:
> When the internal PLL is used as the PCIe reference clock source on i.MX95,
> a REFCLK rise-fall time mismatch is observed during PCIe Gen1 compliance
> testing with the Lfast IO analyzer.
> 
> Fix this issue by configuring the IREF_TX field to 0xF (15), which adjusts
> the transmitter current reference to meet the PCIe specification timing
> requirements.
> 
> [...]

Applied, thanks!

[1/1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95
      commit: 39ec460b56b26319d1f31b459e8be7ea34ae9c67

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

