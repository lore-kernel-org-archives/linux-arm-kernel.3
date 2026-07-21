Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D57C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeImWg3UpWEBMTVyVBkk+sdUXk023lo4rqYx6rHHQnw=; b=3YDiJrPhexlQLsH5TbY87PZ5Vc
	2FgqpP+cf55sb88wjkpDUw1SBkB1TXuF/aOOd/hxUC8yvUl0phgwQgzaMWwSTgypnbGicG7+kg9aX
	5/G7V8WkDVFJEPzeG8xZlHep1txO0BkHlyOHhqALgjRITCeX6EM1o+N2C2G2THm9XoXWrL8CWT7bX
	9N1gtgifl7oeXC0lfrQHXQ9XFHmo+Lezgb/nswtQ1HCqa1yTBdZY6woussm13RU80oPSL37w2vE0H
	lCEb2e4NVb2Q4Wdzno2imx5kRXkVMmzX+693/U1vkP8uIIIswisPAxi26jI5XpRAddwTM2PM8n3xF
	I7dbn9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCG4-00000009maT-33yg;
	Tue, 21 Jul 2026 15:19:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCG2-00000009mZm-29To
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:19:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpaP2071467
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeImWg3UpWEBMTVyVBkk+sdUXk023lo4rqYx6rHHQnw=; b=cEPo/tUbvol8NMA+
	CZkSAHloVdMHHr5+U2G+q722fHaDvdc4HKqrvQ4qwn1LG5b1o4Z9TmLNWjzTm6ST
	1c6DgOl5JYndkk72KvmXPunEmrKqA9CjCq6d0mUfXKj1d90YBaxPzE83Jv6AXMLM
	eYy1j+lUhdFTCtHRoyLSonfXRyEoI8LjuoZylTqfzTEboxKBWnBrB/E3LdC/R4nO
	1CSk9598XVIM6Z8vAQsVuEN72RU+Agui/hPDmEPdDj5Wf+xjEW3a3K416mDsexmq
	aQD81ZcFw6diUNwz/YuTCNi9yLSZVLT6wAeBES9Kncn95WqLtl4j+ryPM6YYUVq+
	oZ28nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3hf1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:19:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso142698385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647184; x=1785251984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeImWg3UpWEBMTVyVBkk+sdUXk023lo4rqYx6rHHQnw=;
        b=XDW5gH31/dnLPNu1U6Ef9hggoYJD+4aCyVG17FEQa7jJpCHlmB7iFw6iTdAZoiLBam
         BdqeZYPB3DtnLn38F13MCqWQWp3s/KJRfCynRPaPC0ij1g9Kebe8fqX20Cg3Td5egrqw
         7t1EUa9sdvaoKN3gZwQ0zeJ72TTh17a9TzmELD6+fVWsw8ry19kxxMruSlxbZjt0H770
         Vl4IWe9F1ijEu5U6izmL7tWt3mPOp5xvVAersL3nf+OHZdnzti6rPDA93jZfqI/BaM89
         3+IDG8/Z9GMNsVSK10QBlGOCd7P6fd5EsBg4WQySjPY0QWNb9vsdn3I/4t/lVY1KJ6qL
         aL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647184; x=1785251984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeImWg3UpWEBMTVyVBkk+sdUXk023lo4rqYx6rHHQnw=;
        b=XuJ2WiViAdaAcRY5WV/bJsMmV7qJtMXdyXvuYvOgp5KDz3uL4AMJ8vF9X/b/RUoa2a
         g91TkLWDUB+2zoLKiNaPYB5fVQY2mhYZlpRssr2+EjudFHbl/uU3201zKistELHCxTOI
         hIHOFUQOrzB+3JKqn9VEO7YbCg+cR3iFMNkRImeX9PuRUccX7WmRdrQ04R2VHnvhCgqt
         UJcTVIulUB/MQfMQ+kHthYy1/vT6vR0sbC1ah8vsbtwQuSlQSLApFRPADa4L9JnyE3p8
         RabxYWC4STnNryFvlSBStGf9UU9RFCr7xXlRohtKsbhp+vJ1aEBUWNKLolcz3ihXoErI
         cwow==
X-Forwarded-Encrypted: i=1; AHgh+RqkpOHML0nBGi6TRWgN9CDfm4tlbHwn0uIzk9h8U5vZzhiTpMWlyVdh531P9/PMrvjlCBLnKst0P6y31IfRrxu7@lists.infradead.org
X-Gm-Message-State: AOJu0YzdlXKCDgaAajTKiqjs4dBKS/yMcXRApeF2dyd87FAwj7hMKNFK
	2c6909HtvajMVYOrDFt//1FzZt963E9LId/E2Ic6NKhmkMOx0pAPivJfD9HteAVqbEdPHz7XDBf
	vJVt+doCzZIeWYGZbjpZsIsMiBHwDlIfTwYRpT0ipul9RY4uTyGISPXnDQbEKfToit514QFaOga
	awdhr/9SaWjA==
X-Gm-Gg: AfdE7clIK7JwId6PEmcZ9MFdIkwQnF/OqL9fuu/VOSkEuWXxGtcx+kyew0DYciCcLj2
	KUN9vrXp8N6X2iPhHV0HQ6zOgUff+vw/kQ6AvCiZ2Nb81SkljwlL94dxXDCI3NvabzLGyXznSmQ
	rjf3nzy3dL+3XFMfMdjS8LyeuC+UniOjwkL1GHeSC7Ikgr+K/oOyyo5dJNgN/2TWqRuVIYdUjR2
	kWGLBF4w6BuyhWej+wyKsmiw+j9WopUmIjCEDz2T1ViCdwZT954U6qRXD2/fq/cGl69K0JBcsp9
	dE6V8hgagov4yxg+Nwveh0cxtjdRdqu8ecWRib14hLdTR9pJdz3TxzxkeclakbKthipr96cOIjh
	DVQyvxWeGH6bhHWaYAk16DZ/2
X-Received: by 2002:ac8:5d8b:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-526750fa557mr26892961cf.10.1784647184067;
        Tue, 21 Jul 2026 08:19:44 -0700 (PDT)
X-Received: by 2002:ac8:5d8b:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-526750fa557mr26892621cf.10.1784647183431;
        Tue, 21 Jul 2026 08:19:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm587290966b.63.2026.07.21.08.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:19:42 -0700 (PDT)
Message-ID: <180c27a4-5058-4072-ad23-709ad6d6ea0d@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
 <20260720-interconnect-qcom-clean-arm64-v3-1-942e8ee7ebda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-1-942e8ee7ebda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX030tKcgweOeU
 3qlMB9xuXpmVb55LFTQB/FKoJ0TuBLw+FMjIjip2pS4Ia30vCIktjk/vgtd42GRA8W2P6sS5j5s
 oxYo3UTT4skDljyaTM2nW2S45ByqQrkbzbt4Hsm6upE0p2XmTnfNZGEfzw81EQCuaBq4RkIKDHX
 3r7Eq0lihw0tHcsmgWPh+Kms+mykPlawCp0Lx0egDQMLSioNJG26m0HPRY2/BDyKj5P6dBBP6yg
 Lov1T21kyI58gFFz7UVdwC2Y1Fy+DCgtpasL+Kd+y5L7HwnRFbXHrpgX4nGmO7+Qdtmg+gpjBhQ
 t9yoJmYJjPwbhZN70ugsW1rKqBCpySP7sgGe4X63T2WEjjIi8DrNhNRBhKHomqpIDR6GqNjd5np
 eQo74tEA0rgiWEL5u/8FaU9LE2mD7tlXjXPMILpzeAsVbW7tNJvFPtrvuQ+Qg1vbAuvD5asW8aB
 bruEJNw2l2B4RYLut8Q==
X-Proofpoint-ORIG-GUID: LK5-E114S9hPiKo9cow-YHcIbGs7Wi2K
X-Proofpoint-GUID: LK5-E114S9hPiKo9cow-YHcIbGs7Wi2K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX6YUdeei3Pbxb
 KyZZM1iHaodKOvNjUzqe+rBheR3K6fQ5CyDyUMsOrLkJkxXBbvoaU80QL3a0LJRPz0bonug9UAW
 2GJuwCD4A2oost7Qtwmnrij+DRCi0Jk=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f8e11 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=N0nv3qFBaOOCOp0HD7oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_081946_557526_386D57FA 
X-CRM114-Status: GOOD (  14.11  )
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

On 7/20/26 9:03 PM, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

