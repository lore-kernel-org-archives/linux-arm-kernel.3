Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27485C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp+hqQqMNpfps3DxX8HzIVZ5L4ni0RL7VXbNl/0NSJ8=; b=vH0jniYmujh9QOIr58fMV5Z2Zw
	in8R1HwWzU81FRgVP3JmOXk+MH5pbs2g6XTkSK+vuX9PIXmrtfwEKXV83m0jJUh8ih55iis5p2i7J
	K7FeTkUQSqdqBbAwUxFA4JiWto60JlbyS0m0f27T1lfpGRudyL5Yw5CC6/bBxZyo+gvWwNgyygjHk
	Ot+8xv7Fb+wim+8l2VPys0nZkrFQxGtXFNlVeI6HPQjGGjLjppqoUS6bCTW2S7T6CW3GkGGRJMXmb
	NqgiNJkaovq6jU6q3yQ7pfD30pVqjV5fYVUYEog41JBiiYeNSoinjMvjs9adqdqOjpxuCzg127Gky
	UPrXZpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wJl-00000008iFM-2ug3;
	Mon, 31 Aug 2026 07:20:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wJc-00000008iCJ-48PN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:20:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52fdL2522559
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jp+hqQqMNpfps3DxX8HzIVZ5L4ni0RL7VXbNl/0NSJ8=; b=T+KK612LWjZUANeB
	VkFdsMWkr9eyhS/Q15o16qwql0zjmx3zVqavLU23rgjw75IUZUoeAw5IHkblRKn+
	7YzUSSJgv8+lF+kOZ2W6XWW5bum1I9EQ+RpOKDfct9vO11Ph6msTMLpc/ic9AYgw
	9O8Aw8paGd/LlJnIuE4ETOoGVuwYXXhZ+vb77bRI3rZ8QAVyFbCKjs8vRFOOVwqN
	jYcwONoZ8zLm1TjLaKsiTZz3e2FqBM4bH5hcaHomWo0mCaNv/8Iyq9WKBXXmSWeT
	sCT2wFUOep/7F5Lk8R53LQ532oQlxD+K1hDs2Mlg9Gl+3TG7dDe49k7ZK1lSrFtj
	9mSIhA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9dyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:20:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90ce451128fso3234426d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 00:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160822; x=1788765622; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jp+hqQqMNpfps3DxX8HzIVZ5L4ni0RL7VXbNl/0NSJ8=;
        b=Xcr1EfOzhq+qFitefOle/s+slTR0T/rbTbr9ZxmLkbUtnIP3beRx8iMcZf3y2pvu5a
         yqTWLfx5hMP0mSGPWJGsrolVBIjdUcGNQby2eOJ9V31U3bcZ6GoI3Irkj01yYrJTpZw1
         4B1bS4vcn88VUm34tChzvoul9Vp+PPsucFPIrTRI5XEyB3qoGJp3pKFZdxRQAryC4+7t
         7t9CR1Mw491abgOvR1ShE0C7/ihWMVzx1v12L5mU41vXxG44rrxbFu+wWrqeEmKab2EP
         jyzHETGjsdUmdfcv32aphtnjIHopwI8o5BgpWicfeLxIeUpwPoQMdZFRaHB9V4I/UvGF
         diUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160822; x=1788765622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jp+hqQqMNpfps3DxX8HzIVZ5L4ni0RL7VXbNl/0NSJ8=;
        b=pYywmkExtdJp4Gb6Epu3r80cy6ml2f7Cehk64z1mm7JssCn+asYfKh7YN/F9b8YRn2
         qDxhfVIEd9ia1DmONMRT5x8+nJqYbdNHBHpmZQUoaqcnIsag/o4eUSHHGA63zF3h4MMy
         n3RMhhgQ6vhQ6Uz3h0GrjYG6ZHqcEjsiStL0PLooox2LYJZGGPCLWSiEpUuMLV+F1Hux
         S+AeKzSs0Bpem8Z3U5K0Uz5K/kbMWLcEl2UiQSsknf+dFGqKKdzdvuUPXXFH5wD2yYBO
         OhnuCWJAVJnoHqC6AL1WLo9AYsnLbu8hbiO/ukQCc0B3NVF2TjlEbJzOToO4/YqM8ETM
         EnEA==
X-Forwarded-Encrypted: i=1; AHgh+RpzpKctkqzxjBRxaxvRXmsM+rwQFmJ4UTsQLOepJSp6jQ6cCLj90TScHwYvN00CEmYlhiehGqAkrn31yc+Kos2X@lists.infradead.org
X-Gm-Message-State: AFuF++n/8WjpUkorfHX9w+6CC6I7JCxyKKfEYRUuf156uzaVMKn+A99w
	kvEwlQX95r0+yIz87npUFo7uXuf+QvYYfZXsj+pRdl0MSAIPXtYNO5lvJVqgaT8Ljr+PGHLtiXF
	U8YsWfFP3tfrmVfPe09RxSlGjHp37VcOTs/PTSjkFCNaVjhmAcFgqESJXyhd5f7GuQGyri2+7HO
	f8Mg==
X-Gm-Gg: AR+sD13zkRg0L7XMBEZwrwwAE/dlnI5JPFy6sQAmZADfHr+dDorvsZHpINTwmkoH30J
	GGKJJRYA+mV1u7G6fsxbqg/KGbrNWIhlpceSGfwu2h8c+G5c89zrsYiWLhhPLs3dswOtrtjyQn9
	QMYt7I1FQz3g6MwpCFBbyeY02Tb6S+i27eQ/KlzWJP6s5uMitlnzGgM6JjEgv0d14FWHCDymsta
	Ft+MpziavE14uB573gmg0/PnjUe+rSbia7V0Cel0sVjVVi/Rcz3Cf3XCf23Mhl8yvMHzYU+2bz3
	Irz8EZ2pl193gJDSS3NfnEREVv4gi2+3b//hfRAyZx6LN6j4jCkzPgGwBif4nOTUCKQINIqK7s/
	uR2n5ePR4PKTwO1OEko2/QA==
X-Received: by 2002:a05:620a:1b9a:b0:92b:7420:bd58 with SMTP id af79cd13be357-939285432f8mr771689485a.0.1788160822420;
        Mon, 31 Aug 2026 00:20:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:92b:7420:bd58 with SMTP id af79cd13be357-939285432f8mr771687685a.0.1788160821970;
        Mon, 31 Aug 2026 00:20:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2049sm405315466b.36.2026.08.31.00.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:20:21 -0700 (PDT)
Message-ID: <655e39a2-88d7-4522-a27d-767dc9578aa2@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: qcom-geni: release DMA channels on probe error
To: Shengzhuo Wei <me@cherr.cc>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Wolfram Sang <wsa@kernel.org>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yao Yuan <yao.yuan@freescale.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a952b36 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FqpsaMCCsM1CaQCKzz8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MSBTYWx0ZWRfXw/xjB4EeReTC
 K32iUScxgMUSOjrWMT6PK2xfr8yRL24VDGIk4yGb98FZBMkumi6O4rQbixBtdIOr3OwBElCvWMz
 zBu9SHkAW594klZX1cwlzljmB9EKi/c=
X-Proofpoint-ORIG-GUID: 7lur8OZusvu9ipIaC18IH6OspUIxiUBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MSBTYWx0ZWRfXxTNrjduAviwK
 sw4ylRrmOyQyTTiQaEgoFtP0sSK5n5Xgz2HNk+lGsZQp8ehXlg5dyf3AE/TLyZ5Qe1Rx5cHdKar
 J9AYXwuS4z5udX0LTkyRrfZIKk5k+tAn0+kV520vw1i1CPqhlGQ8qo4zvQ8wOkENC55jCbkykcK
 Nk9XfYfRcUOLLWGPMOVY/AK/LIOwxt9/F4zB24I4pFOcfTI49cZICG/QgxkYnLGj/wlCONhpZrA
 PDujrckgVxjN/pczfR1y65BWZV78cpr0wYBAY57opg5kndtYY3fKlhaIcdIpogLwQ//sTNAG0Su
 mbxlUWx7ILOcCZv4WVdtPCuTCswXGZDrO5yIvHPMMfCLMfEy1CWpGqdliJQo1lcb1qfpijH3mPO
 SUDazQw9H2YT8FNAgbVpEWSC3rOlvcZKgy0VQrrbxbp82iKHQxvGxPbkgodPRBdMRRYENhKDKeN
 kwQUgJmNyv2332Fd3Yw==
X-Proofpoint-GUID: 7lur8OZusvu9ipIaC18IH6OspUIxiUBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_002025_145243_7FE5ABE5 
X-CRM114-Status: GOOD (  13.61  )
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

On 8/27/26 5:43 PM, Shengzhuo Wei wrote:
> geni_i2c_init() grabs exclusive GPI tx/rx DMA channels when the serial
> engine runs in GPI mode. If i2c_add_adapter() subsequently fails, probe
> returns without releasing the channels, because the remove callback is
> not invoked after a failed probe.
> 
> The adapter-registration failure path used to release the channels via
> its err_dma label; that release was dropped when the probe tail was
> restructured into geni_i2c_init().
> 
> Release the channels on the adapter-registration failure path, mirroring
> geni_i2c_remove().
> 
> Fixes: d8d3bb127ad1 ("i2c: qcom-geni: Isolate serial engine setup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

