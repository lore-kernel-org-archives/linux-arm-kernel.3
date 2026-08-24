Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCF5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERZilrXY/3hHR5+jqOyEP4/9xdUWJrsKbHUl2RWk+U8=; b=z0ajM8girGGCPhArwBAy0Y8idD
	VOd+cDHTx6rmzPDo6C1q2fmIQ+88ANWn1XYmpu4/p1GkI1YkSjZTj6b8nzfPtKLGcUvgoJGQ481Ul
	j6ZP3w9EVxcKwAMscJ7o2OU8giNzBeKNokf4AVsF5it7FFrqnGg6W9ChEzBa3SPn0GO0/PUfVNRvO
	SV5EF18vA992beGo8yl9tfP2ReV/hcw+MLVc6TiddxXCPQrOseyelQmb7cbwnnX7sm9vHdWBxM0Xp
	9Ol69WOBOOoUP/Ylab4xPuRN5aNvcb/GROd+qC0Qam+VWztQzlfArn+LNgryhK3slZkp9EGILUrU6
	7zD7DNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXtu-0000000H5Cn-0AQN;
	Mon, 24 Aug 2026 16:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXtp-0000000H5Bt-0BE2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:51:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFnRNC2384990
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 16:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERZilrXY/3hHR5+jqOyEP4/9xdUWJrsKbHUl2RWk+U8=; b=kSXZ2Zu5hKXsHruL
	1w4OpGry9K3Qi3G+Dfj3eR7JWTXK7C0vbNrDQiauyCptqJMm0gnvoYrPNJev1bg5
	SaT3aqroMKO9zbDwlQl7hQlMab2QsIAMaAEWzU+L2kd0ddpodr38hfjgfRqdV7dS
	CjatDtUGsPbFBSvnSGZmP6SYal2i3eySlmqNAj+oPywRP8BasseCOy/HVwCPpOGk
	5Z4x1J/pNdFl6/tnzMBQspjf8zmlIihhDj8qKrZpBQCOaqtpw2RghTLIXeZf3C8b
	W8pgxLWufK948I69hHPJ0SAP0c3blgKJeaaEOeSikm8S5NkXjbjT001UWokfMQXm
	OzzDvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv79qw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 16:51:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfe48ca1efso52905405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787590297; x=1788195097; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ERZilrXY/3hHR5+jqOyEP4/9xdUWJrsKbHUl2RWk+U8=;
        b=PUTCxW1MfUaOwSaetugOadXaFOZHSequbIdMZNrMkOXBK9VTgMIRmBN6oHLbIBkATh
         04EI0X0D9KkqbPSLY7s2arcC9EjZaNToqGtrAbWNTnD4U+6XflOCrncpWY4MFIUFBlOp
         KtrSkv6JWAidROlJFW7RtZtd4JhfgIeLgEnPRHGcVO5oyMfQxToVbxq1cpyLro627Bfi
         RSNLPPYZ+fkxmFN7ZGjhzgE/paswEpXgM62eUbKssMhk/I2cKuygDHreUmmbc9BmSFot
         DgMMdA6BYLKgd59hX5/cwrQIJd7IZqTGJhkTol9nDSUtZyY6Tq2B1s69orJYPqsZ5jpJ
         WaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787590297; x=1788195097;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERZilrXY/3hHR5+jqOyEP4/9xdUWJrsKbHUl2RWk+U8=;
        b=nKiNs4jVuY1epyZ1lMUIMVY1l+3+x8sEvKdAF+N1dk1hfm2H9SGHkQlLm4zEkJAm5/
         K1GLTBBwOzYKL2SRsjYuIaWswA4pAED8ZDQ29Gjo79dQz34pQNlFrk6QAMetrOtZI37g
         hPvLZWFtA8i8oiJ6Jz753SLsp5PXDhnLAxQIBnNoUssjUA/9O27UHDFslxgwKoOviP9/
         7FoajiC9vG/AkAVCDipgHBHTkoAR8nRdP//5BSgCA0HRZ0usUNsv3f++mmZVAd51UKGN
         EM1OnACDtdIovoWXFsijORWPJ2wehex9wG+g0Swv2ckglZS0Id2nMFdVw9BbqZWXMKMh
         1wIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqe67gLrAPkKu6FWSShL4f/te/jhcktCSgArQT97xSQN+f096Jz/WL8ujVSb2xZQy49ilfW/YgVu7Fm9/3pSgdN@lists.infradead.org
X-Gm-Message-State: AFuF++nYYREm/xbr2v/zHLNQpCA6BAFSCc6NdzudiIeIImpgtHhELVeD
	x2JzkMBBqwbQpsqhlBFkWPYhzFMaSQbrXp2GSKMQ6NiZD57kFcg/ln2k+pA5ymPvntqAh6hSDLq
	fKf2rUnh3a0gyU9DEcdDxXYPJh1lDAxgH5RDTh16rbQ2aiPavEYlNxHDoYvruENvd2B7g9m2uqA
	NWjw==
X-Gm-Gg: AR+sD101mU+uTes7e68HHVDoM/E+Apl2o/31T+ICh4ex2uJBZa0qdx/Jqf8bQK8XLQu
	wDb77IY72KdXEhDuhXwmPX38bspAl902g1u8hc6j1gldETH9uBOBPVbtuNo94eRJReXKs5mPzMl
	PLKNqTBIz4v7mR7s3Cr1pV2TiAC1cQXK1WKqbNIqlHevwfnMtSWjnxbQYfU1F64vOmmiC5Rxutk
	120PvoOMegxxLNvJEO1T5G+3pNaxVxE91GDccZluGGzY5gz9B72hiOIXWEBOclwOWre3mYkyrfj
	Ri5YjoxUU8YD3irNO7H9NaYIq0AJy6UrwkUYknkSCjQ+VmzyTu8f+yzvBv0szrIr4Gm2ybg5+t+
	5MXLyrgI3mwyOOB9cKpGFzG/DhQ==
X-Received: by 2002:a17:902:d552:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2d670b85ea7mr430160885ad.5.1787590297493;
        Mon, 24 Aug 2026 09:51:37 -0700 (PDT)
X-Received: by 2002:a17:902:d552:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2d670b85ea7mr430159625ad.5.1787590297053;
        Mon, 24 Aug 2026 09:51:37 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768ba291sm20372535ad.64.2026.08.24.09.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:51:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:51:33 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
Message-ID: <20260824095121.00001b9c@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c769f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Y7bUGcAVvLU6MJrLthgA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MiBTYWx0ZWRfX+1rz6iA4Jp+l
 kud719C9EQJtQEJTU5KcoozDkJwUTx17y73YAW0dLW2AehbhqikfxQ0BU8EfAooVi2etd9yplbn
 V2YgBemQb65HhfhrBFXKR8m8b9gUXiE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MiBTYWx0ZWRfX5XVeI9Wte6DB
 BVFlA+ujMGtJtqnOmrGxOsbQv24N5Gf358A+KUNVtpG4KANvhX4LSuRTVE8ubTiAasGtZ2xzo8+
 F/vhBi8a2PH9Hf9+vLsVQ/nokXOrA1TidRdbGxCHzI77FOoC4heBPPRCESyMXirb3QWslqKIUY7
 AeTRtVrvrQpOrvKjX9YttxPPzTCv3OciE35bgstugE4oUVsMQmdUWiDPD+qv019JBPaBX2D+N5T
 IOSYI5h8mFG+hwhIykW9ZqA/FQlmzEXpZR2fhUyCzLC0Z56igtLmBfNxXqNjQGMGK1b6YYHb6oO
 QERahnwqaAAd7FxlAw1aVCJ9Cy4EmbXgrrHQrTk4UWaapTXeNVlgHIBb4Ysdp7OO+8UY21aC6ex
 8cewUlMgAGeOZ9OkaFLwQwf55CVxBcVUH+YrGzFDgzLd4yTMO3dx7ALq5/lzOFZua2rYYP/qIV1
 OzqD8qPEBqKgxDZyCmg==
X-Proofpoint-ORIG-GUID: 1pHv_ixWxXi4Kw2sDtUd9YN-87ROK9aa
X-Proofpoint-GUID: 1pHv_ixWxXi4Kw2sDtUd9YN-87ROK9aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_095153_109445_4757B7E5 
X-CRM114-Status: GOOD (  21.96  )
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

On Thu, 13 Aug 2026 12:32:56 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Add a call to device_set_node() in the SCMI probe helper to associate
> generated SCMI platform device with the firmware node of its supplier
> transport device.
> 
> This complements device_set_of_node_from_dev() and ensures that
> firmware node information is propagated correctly for both Device Tree
> and non-DT (e.g. ACPI) based systems.

Hi Sudeep,

When you say 'complement' I'd like to see a little more.  The guts
of both calls includes setting dev->ofnode() adn the extra bit
in device_set_of_node_from_dev() is about ensuring we drop existing
node reference (there isn't one) and increment the reference for what
is the parent of_node.

I may be wrong, but I think that is unnecessary and if I'm wrong I'd
like to see more info here on why it is needed.

Also, if this is commonly needed why doesn't device_set_node() include
that dance?

Unless I fumbled the command, a grep suggests there are no instances
in tree of these both being called near each other.

Jonathan

> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index fe8c22cfb9f7..cc7d11c3c1f3 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -650,6 +650,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
>  	}								       \
>  									       \
>  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
>  									       \
>  	strans.supplier = supplier;					       \
>  	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
> 


