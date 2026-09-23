Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55750C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mV/gojTVmImKJZBOpC9s0FdYNTfJGxjHgrYf43x+M0Y=; b=kCmP6AjM3g9CSblnlr32j3/LfX
	ngHZO5mHz9Zu4eGnDPsQBPkQR1jJOHTVcsbYyin8vx5vuZVV5auv6jm9AN3KxUKamTGG0jXs+5ebp
	zq1nfKOM0K7P46+/tUhCMDzXxEfICVix1soxxOE12evPdBAgxkdF/xU0SkOTwROuM9PGdXj4UV20Q
	Ksriynsjy2X8ghYf3MxCApZmTPfyiHV2IjvyNBPvr/FsVw/eZlTsIL+6GxJSOiJv5L2RnjBm5BcG8
	XS7vv15pR8BcgoBXtwdpHTpxgb+MAmqoZHbnNKwpaElfgmQ43nUzhd9xC7aJOt8OTmGnPZ59qr6od
	5U4J5ErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J3M-00000007h3m-0Fpr;
	Wed, 23 Sep 2026 09:14:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J3I-00000007h0J-0ozy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:14:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JbdM2028414
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mV/gojTVmImKJZBOpC9s0FdYNTfJGxjHgrYf43x+M0Y=; b=A40Ok8AwRaKC9w11
	n2SO8xlP+PGzlB9ZLgRSgTrzACaV4xim6erL7C1YtmK8VrepFEzHKBjf+pHGGwNo
	J/M/7v5lWvo8Wg+fl2HGrqE+tYKgAP5Gblm7PlwrEuWToxWdGAKcLPy0pgX6ujqk
	6Rguh63qxor+yU4w3D+2ED+Pnzhp5Q5O2uucFk/Qo8uKwjI49s0o1hJEN+WLantb
	jBjc8MVNlQOQlC3rxoNoOz7X8XQD73zWaWV5cNqElWYiawfdvvvLUGM/lWeUG7by
	PsiQ4XHpE0pmDc7kktKLqtHxQwtt2n4qtoHBdOZaRO/s4iqYc/92gMCWHwPK8dL7
	Zf+uxw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c37d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:14:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106a836457so1881606d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790154846; x=1790759646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mV/gojTVmImKJZBOpC9s0FdYNTfJGxjHgrYf43x+M0Y=;
        b=OIPHiDNeKnh8AvZV/n6Yo2jNLgTlQe//2jDOrUKc3hZZW4z13XeWyEyuOZApTMon9n
         azUtAns5iiQP4nufmuG9LDuzU2BiyZZ4i+HoUl8/yD0uQo8o5/Pb7G5ntx/TShDuB9sO
         tMHEtQkpRRZHnlHF2zkfRtFAX204BRVzmbnZRpwUXvUmuQmPSiP2MYNCyVUkJ2PH7Jeg
         gpTXmTzrPDgXY1KVSx1S5/+dkMjS5HiyNnYe4aiBs66JG8q/ho7ahRWNPNu+duKmdg+3
         FuE7YUW5QOqmLEsDJUFD7wJcscY0MIgMmcgfg2VX+SCs4+MLdkYZaxcE9smyaKqUP/bE
         ksXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154846; x=1790759646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mV/gojTVmImKJZBOpC9s0FdYNTfJGxjHgrYf43x+M0Y=;
        b=kOYLRJs6XJg3ORnEGno9V5TSUik0J+d2zVXyIvGZejoRXllitM+UOp+CTEWARJ5JPY
         /UK1KU25MCngGJvSkGDqw0C4iYup945EF/N81zT30U0U5TCdFv2TwgMi24dkmmMF3uD8
         PKZGg5mp4vou4OFnzxWpC9zoEwyr5078ih970FLtixLioTw5XmaQHlyh1+s7hHZ+xrnc
         tzLLNur4cjlBfInxinrQsPz0irozuHIesgDTj91mFEoEwKQqTU0VELhSUcLlbF9qNqYp
         XpFEGlRQBNp6D+BjG9zqOooi2vuelfF7MonZuZHP1MdopnAcMlQVTd9cEhKWfnWFLeHO
         ClAg==
X-Forwarded-Encrypted: i=1; AKwUvBzAOqRC5R1MeTpSrFD+H+6VTXVCDShi7wPFI0aJkB6iUDWNVjs6iWp+Yj2guHAnS9lCG2WH5mSMy+YF52sXX2XN@lists.infradead.org
X-Gm-Message-State: AFuF++ltJ1l+rbDVSiOyopEsTNpc/n3hsrzW023w6Th2Pz2RDc+2TMsB
	ahiIQ06CW1cLg5aH9gJdQ8/5VKpuysg7CEUjUPleVZt/k+nkSFpawXF5tfOLSFb4aYEgkrJIv0s
	hQE7Zp/PjVdWeFOS7UObk5li17XCsb7etRueWOpg2UMF868CGXQWtkATglral8rBzzkC5pW+ZFc
	IdXw==
X-Gm-Gg: AYBFou0tyCgTJ9cs3JvRsuNlqhseRykW4FGoWikFDq9aaiQ4L5w/NKT+LOvY3IEBHP4
	feWOJDVPi3vXGks503xr/va/WdsAzB+JoR++otL9cNwbWxClaHnAk7Yhx/YoFDIj7PrZAZs8zn+
	xVnMcVkB/lyVNw9yb5ZEokOPydE3miS89xdKio8WdkCcP0ifLgWSaD+ZQOm2WAv0P8rpKD8XO3i
	CCtgYhjEX6RjkveZqWQJ52+58gzE7PbdCNTegXoOnbilV4mVXZseW5HBmBvVfmpL16RBNPbKczQ
	2WYRWRilULSiMtZ5uF32R/f13dzrpI73+y/k7npSb0DilpulAuHyjo7XwsFQfNiX/q645NkQRt+
	LPFx1WYjhHcKQ6VVVv/otow==
X-Received: by 2002:a05:6214:1307:b0:90e:8d21:714 with SMTP id 6a1803df08f44-9140c3d4acdmr34671266d6.2.1790154846493;
        Wed, 23 Sep 2026 02:14:06 -0700 (PDT)
X-Received: by 2002:a05:6214:1307:b0:90e:8d21:714 with SMTP id 6a1803df08f44-9140c3d4acdmr34671086d6.2.1790154846102;
        Wed, 23 Sep 2026 02:14:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37eadd4sm1201464a12.1.2026.09.23.02.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:14:05 -0700 (PDT)
Message-ID: <0d04e028-39e1-4798-a0a1-22997e2b1499@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
 <20260922-qce-fix-self-tests-v9-14-b1aa742e79af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-14-b1aa742e79af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kx-JVxzK0UVgkCJ6Wpy57ovSQtEF7OuG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNiBTYWx0ZWRfX4S8OX9jkSFej
 bQAONRkKTveNpM/D8+t8RBTpNiMlZ23hsDfb2R/4HuhOpJxzn9Swc1LrlDI5oWhYyiAln6g7+NS
 QXMSg2JI1mn2rJ+iZ9N7tPnLIE3pP0s=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3985f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pb4zj8aKiTCSHAFuSYYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: kx-JVxzK0UVgkCJ6Wpy57ovSQtEF7OuG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNiBTYWx0ZWRfX+4P8JuxalZIU
 GLwYT7+XlEjc5Ay3Adh8G4OXsoqCaPzCoWcZZNVoT+d3LVjqhJDGrgW4l5amp0dGOfUtU375YQA
 EIK0rww+YzrdLEIb0vTS1OxslYibnKqlNpW4aQH3jor19j4TOo5b6+U+68ylwdz2NXbg8KvgB9l
 9Pn896cmf/w8jLjxmUeM2VjcEMI/w7Ea8b6clYKdAYt4xqhRfeJLfpMduK9kThGhZtRcUWl/Q0I
 aSO32EH36KVCLpP+49cxtWV2lxr8xfMH5NtnBWwUcRWsHz8lJkwBk5UgY/GSM+LcOry7QDgIdot
 0K6POOZ9ql63m1chda4lnqzJjp8o5zbiIN1MokZwHlMRlyKp1Lnuwwi1HkpjxoARTuMR1p4vS3u
 +Hf2x9KtRewKQVyDGRx5whxJb5XFdpUlvM+HqB+PcKJdTADCM7RUxDyYCo5g23LQhbEDuYcwulk
 RSQ2OA0AwhKn1fFou0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_021408_422295_6E6C9C08 
X-CRM114-Status: GOOD (  12.91  )
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

On 9/22/26 2:57 PM, Bartosz Golaszewski wrote:
> The QCE core driver should be enabled by default as it binds to the qce
> device node and scales down the interconnects if no child auxiliary
> driver is using the IP. Add it to the multi_v7_defconfig. Disable the
> crypto part of the driver by default.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

