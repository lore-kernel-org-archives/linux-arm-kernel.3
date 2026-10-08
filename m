Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE87CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=; b=rZAnRlPKeGpYSYc72Hku4Jizn6
	c21/zQY3NFKGEmDRNdHvXg/q+zrZkPRF3Go8QybCLJ5sU1r8fBjhUeBzf47eXd0Vnt//mp1NecQoA
	NSdvu5R4zRJcOYudNVS0hKicKqLAWTSye/x3F2GsDx9nTGfOG+Oypd7nBusVFq2SSDRAGgQGUStjC
	jfy2agFt7G6xeO+z7pgEbWdIAyCcoQJoxXZs2n0gUfAOFw0qxUHdkSHThbpaUnJleAPCJy0ixpdlz
	LTzQ8IJ3dZRFiFwXhAcCmjeK2dvXLmanZRaSOVsoGfw2jaB7iQzv1kq2HTZtgvkbYzdoHtZK/MKr0
	KnL+Xq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmWO-00000004Gn9-0oeN;
	Thu, 08 Oct 2026 11:42:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmWL-00000004GmO-10r7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:42:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKPNL3100006
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=; b=TnABhFxqn5/+RLet
	8wyGelZ8cIJkvWPZ9KH2pi1H8k8O9pWJ+Kw/Wy0jJ5QGwtx1+n4klRvuAWqc+Va/
	gYVTyeS9Vm7twA3BkB/4/f6KOWm5DZAtj/nKhuRdyM1EPongJiGliKyI1FKhm7Pm
	MXaHyh2F8OYUMfy6xJ+Ig0tw0HVbJSEPlx/+DylapCdjLnv6vW1UYE3S338RhlOu
	XqecD6vzJCJMxS7yd2Ys65NB3Q4uFLhgj8NQ+M8diN0igPBXfWA42ZNMMKekqIya
	G1/dC8FESxiiINDlNxK/BDuGl+MG9KpyCi79Tzts/WEkyiOT/rhahcGVhe5l6NYU
	Q5IfVQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82n7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:42:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313b1501a0aso827510eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791459763; x=1792064563; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=;
        b=I03/WpbMr0Nix9BLD4YKL2ShI4SVc+gXT9Q2CxGuRtskEKR2gs8ngWgyGEU5bmt3Co
         q1RSFdbjODqgXY/PcEQitzZtSYb9QAblKexhmf3cgzmPKbWyKiyNasP6vCcDfnJ4cOzg
         a+GA4gRF9XgD03IK/kh9sCd1fLqPwSMFHUgcM0euiqio1xIyRC4IHmS2AIpAsNNDr1iu
         f8Mf1Q4maoa9+XYOI6ws/AciCvktj+xpyyCVoT7jc/P9iO/y9jxdZeJNXdbKb0VY0ccZ
         LEGViZrmiSMFXru592S16N8Xtcx1YuyQr5hw2WkSngEMBoKdtWLRW/5R/GUanot11U4/
         LU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459763; x=1792064563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmC3SrCvP8skXHJ/mHFyl+TVaRxCu8ilerp6R7htgl0=;
        b=H+fdym++hkHUMP47et/is7FWx1GfzqeqaAnyc2cHrTYulS9j4OWSx59Lw6QynrWi6f
         rSTGk0Q4sXqAFYBlOJ8l0BYG5FYTO2zmj9nOYOFWNPbp8gOJws1nbOXYvRzsIW7v0Mqw
         6Yuyyq1EWAMy4BYu3ehyz9RbpeCQDA+y+pH1pJIjnyceSL0it+CsP+mXGnTD91lZhs8c
         vH9MUWEMzunGNmYEyXwgdOQBiTx7ou0VXloTS4nHJMmGaB5NR51C824PwMarV0JVNdr2
         brSgc1GuGuFCec34v0JvXvJg435p6du5qmYGZfxdeDt5z82EcQgpRctVYowiDfsxgY2a
         dgqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgyDSlnyJRrHfb7QVub3NQBrD3yzIs5LWWmoBV9xEc+ox6PZ3pSTf7lRk4WfwyTJdJqDdKHB2/NvCeM06O74ZE@lists.infradead.org
X-Gm-Message-State: AFq9FYJVsSOPU2kbkrgJAzFVxxIun9Wa379kZ/4zlsU9a4cAksqlJouh
	vZfMrNhfdZrcyEjU9xuvJGQZc2cvI3UPAFVA310hXSxANsV1g1Y2AlWR4+ewUWl3UPhdCl/veaa
	mge5r6UuH6UyZ5L0mFzWr4Ari7KVQG4ooeg6FJEqR4UtkWPMyZniFEstHrGFIjFiuAZB4DphQ5P
	Xz0g==
X-Gm-Gg: AYBFou398C3BSy17mWuwD9z94fZMM8xjrLzHsefk8hqC87WvqViozjaOu3x3lbj3t/v
	G6vxkZSMXew07pEQCFGb7wsVlW90SP2cLbEG7FsxlOW1SSqQAfrr28Kck6kBGflqUvRQCh2BsuP
	qPBvk/S5chK2hNYzWuHz381C2KziHTpV30vAOP8WIl7QoBQTIXojbkIYT5O0P6odRr5Od42zYQ0
	nz5KWUpfsjgKl9+L0Mt7WgmGqy6Xjaei/9ju418KVOlC+PThSpTRRno8bqQeFU6r/zQq2k6hbUU
	rg/UyL87dN06U7nOFlypQYjiP6ExvkwfainrOPUkO8TbJJiwuKzpp81Y8eHmUyaBvYwK0V9spf6
	HaKM+bLPxZoa7JwrPUDbeNyQXci8R+Pg=
X-Received: by 2002:a05:693c:630c:b0:351:d38e:6c0a with SMTP id 5a478bee46e88-351d38e6d5cmr2228640eec.0.1791459762575;
        Thu, 08 Oct 2026 04:42:42 -0700 (PDT)
X-Received: by 2002:a05:693c:630c:b0:351:d38e:6c0a with SMTP id 5a478bee46e88-351d38e6d5cmr2228565eec.0.1791459761768;
        Thu, 08 Oct 2026 04:42:41 -0700 (PDT)
Received: from [10.217.216.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6076sm17870481eec.9.2026.10.08.04.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:42:41 -0700 (PDT)
Message-ID: <3aa2f7ba-734a-4d50-9eb4-cb7322449919@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:12:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
 <20260731203515.GA1619665-robh@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260731203515.GA1619665-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfXzJdJTHfQWDwX
 OnnagBTFQN73SdQWdV6+HCwq3l1z+Ft6ClaBAkjCcBdZVBrhGWzJwNe+wDGdLjwwFvktVufP3kY
 n7zUE4C2ZdMpbc6hQArT91hXxWXnXywkVVgZHgDEVyDdJL117+4wHl2zvZp3R6OghewYNafn/NQ
 4/ASKKLk6eXPaoHExFXyrHUxFgb0rdCEnV+UI6UjXmvMMKLhEpBqrqkki5PAwxEmhaFyLlpXf2t
 jLWCozKCgfvN0c83Bo7X1+S/TKW7SN64GS/v4nOssfPwTEiOHRGbPgQtxPpSwlcZ3972317HrGj
 Xyo+4lUS6aG2xjDEit2ERfrL9ojgFhNO0kHyKO3yl2ZlOAjwcXzjba0JsjBiA93UGgFWoAy6DJ5
 9+PDuG5hpK4QJhl8iNl9oZ8rj6nMSA+ilThM3LlFEmtMVhU/AB4lwIQLE5W9qsr/PFhX6tl72KU
 KPlBkY6cDIqV4+tVYxQ==
X-Proofpoint-GUID: IJ3_p033lDpsRprgpq_WsRpqLTWECBR5
X-Proofpoint-ORIG-GUID: IJ3_p033lDpsRprgpq_WsRpqLTWECBR5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX7tA28dUz+akm
 4OEWvHixCArrsctxRigSzepLDg7lGQ0MMuL+W2UX6AaZv+a/6L7n1iQvWpFaVZDUj2uohKFmexF
 0rFk5G2dc5YRqtNik7l7wnzcqatpVGs=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac781b3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=txCGJbmANruv-OSAE2cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_044245_399805_6B88DFE1 
X-CRM114-Status: GOOD (  13.13  )
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

Hello Rob, Krzysztof,

On 8/1/2026 2:05 AM, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 01:49:51PM +0530, Umang Chheda wrote:
>> ARMv8 and later processors implement the RAS (Reliability,
>> Availability and Serviceability) extensions, exposing hardware
>> error records through a standardised register interface.
>>
>> Add Device Tree bindings to describe RAS error sources.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/arm,ras-error-source.yaml    | 330 ++++++++++++++++++
>>  include/dt-bindings/arm/arm-ras.h             |  11 +
>>  2 files changed, 341 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
>>  create mode 100644 include/dt-bindings/arm/arm-ras.h
>>
[...]

Thanks for reviewing dt-bindings change of v2 of this patch series - I
have address all the comments and posted v3 [1].

[1]
https://lore.kernel.org/all/20260918095746.3347893-2-umang.chheda@oss.qualcomm.com/

Thanks,
Umang

