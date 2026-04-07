Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFDDEDB7ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=; b=M2SJsIh5e+ysiQXKIMmLj/f+jx
	gO4Dtw2a1yKL4T3ncwBAZY4mtKa5dD8A7YyrTFg8npFiIAwohCDvsndfyQ53z4F+jy5VREGRdbpee
	euUFRoXY8k9qJSM02lxv9ETn+JjEoIltCbCd/4w5Pn4he0ZrbJDK8tXbQ6cawNCJAZuX5/LHKDywe
	HgtnRy5owx7xbN9JY4goGaI+B3sAR71nF0nvMGsL29mo4gJAf7FuGSzpaydQ5ycuG/QIQ6sW4CZMa
	BYDyTeJgfndlM5uBgotfYa173GIm6tiQl0251T/hkQIVt3yqfXiJj8XQE3R/a04hS7qj8rG1HPusd
	HjtXLYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3eN-00000006HVA-1joh;
	Tue, 07 Apr 2026 10:27:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3eK-00000006HUn-2q3D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:27:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376TbDd3537314
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=; b=IA5fkyJvl9h0hHVo
	DOIu8XsmmeEekiKnN8+PaChhtIMkjVJrVtWxeZrrpt7ZF/wp/ioF7ruzzSnj65k/
	M8uJQwIELhJ+mzfmC7kyjuUucyTFOIvz7w8bIP1vsHSNi3W/EZgoQ0q7VmrEr/mP
	8v0gBDrC75hq6F15CNUPuzCDqP+jPDSWX/hTNRSC72gSLyTzFkCBZ0FFaK8Ng9iU
	7JP3L5GShHhKmbw48Poz8ofFge/x66g2b8guwEFLgfcmrBcudBfFX8w9tK/bfMDD
	GsP9LsKvQNTt+qpa+BXcD2GdhvoFmxjiCkSoxXc6v/ssbJnaa8+umywahI20laEK
	3vxbWg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra29nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 10:27:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a18178713cso17038046d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557631; x=1776162431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=JEh4UZXk2q4dDv8VEYTiTmvIQm9LcY5QLmqD8iomoihgXQpNcgdLYUfAm5YkIC6HB7
         kQ5Qpop90zgBmlyh2sa+qzFG0qr+cWaDgOFfXXwlZKmSQX2pj+R9332+oNczEldZ+iwM
         +pkhiwUjAWyMWQzGA7Uh8rO8hvM02OsTgiirniWSLerfagmxvfKkc0aFPYQLRTcVPOcH
         d+29+lB5Jsj8UaiKB9ocxPaGa/o+RY9SsTCn3xjIzLa/qSbVHXrwR22UGdgYxj7Yu7Ds
         VaXpjYaUc5Yawrd8QNUqz1q3Tw1rF/elGU9GfPHXtWWSqNFiTQQA4nYvXRgkFy3/MBdr
         7o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557631; x=1776162431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=a+MxZvDwqNF/NPNxZlHmWa8HCO2Ysjbk3YFqNFfWUKT0H4PARu9IhrdD0eEsCd8P7i
         F7w7HQs8hkM0m4+zMioKrm1EmC40bXKFa7NqTW7Oq9ehj0P//5rjlcT6llLM0ryEoU3t
         Cg5h4gvuZlXTMtT4rdSSNA4y9wUZuLFQGlinPg1yQXptx4kaT+295t9MaYBlJb7Hxcgo
         dveq/A5kwU1TlQKbRJMdRR9lRRltHKZ7FwQSXMhlHmzwJ9OqUdblFlCjY9UThV1xH3Y4
         urWE9bvz5JrXI5AKvfIaK6VMIXPD3LPf76dysPkYztOYaG7CaX8oB4oXZV5f95ewG6M+
         G3kw==
X-Forwarded-Encrypted: i=1; AJvYcCWw1I7lNKUXYebSYHxomgo2LnU1GjT7TAtIo7UJPB1sgAM1QbRIRhivdqRsKBRbYLsMDMwKOM83gDuqJ3zdIzri@lists.infradead.org
X-Gm-Message-State: AOJu0YwC8SRbiTaPkbZw2PEIOKP+RJg/JL0CBOqcYKUOd7PNn15VVmzl
	wUZW12PzQ0v2j2ntyMunxMhAfE3hlvCtymOesStGWSrSS+P6Jnjsr6zZG2QXlo6MWxCEm3uz6xH
	PNuiwGbcKeVxl6aN/Qkv5fckId37KOT34A2e10+XTMaQGdYroO2jdSlh+nTC4bhuE/g1b+EH2mF
	z/og==
X-Gm-Gg: AeBDietoqaQ5VuE5eIspHPTmFRtrWswYazBVu2hnX8e9jGau2m5FPCdJuIYKYzU9U7E
	mAmXiOgiqYmZwFKEuZG4zumXghOSczejOjQ+3QFwgoo+q6Xs8NBbHP5N5wtlySAarBkQ7Ro74hM
	HPNK71lhEX7U+5yGCp+GyQi4+H9FjsgXd6iGjvC7aR0LEwnSiiPPISU1fRSw3BxdAry2pXZEApi
	nw3htywOhnhEA3vjboy+ZlxUoRyE/HRO9lBwTkYSRZ9D29rtOXujmzYjFZ1n9DGdtonUVTqvv6q
	/VmN8X5j2bqzN+r1MaHUGWlvrjo3P/LKb+WDiOuJheeXMwC5KbAAnlIxGnMqPxU4U0J5Nit2B7i
	/J8qVtuTSBz33wAV4NY36yE/cpHgM8zWaEwxbekixSNMtyECJbuy3NA+hy0SA0TOJ4yuVuhh/g9
	wzVL4=
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040696d6.0.1775557631047;
        Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040476d6.0.1775557630576;
        Tue, 07 Apr 2026 03:27:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm538210066b.40.2026.04.07.03.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:27:09 -0700 (PDT)
Message-ID: <42f82377-c30f-4cf3-a57d-9c85d9c54053@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hzk387YLl19vB10-qG4525YOgPgtogAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX32x4D95IuG06
 2/BRCZt/fnRoU0VXGVU8Z61EVl1Dzj6t7KpZj9Oru/rJn9rXxNrr70y/RuZaTOgPcOdBe/c5xGa
 sOiSxXW1Fa/lCuCAk0+kbaonrqkLeZUO8akMJrEyZ7BYnu2RsOVuI9dQVW9OKaohz0UIJBhwRXl
 QrE3Bsxc7lsdlKq6w+63PJFD592tga++xr3pAAWNHAO763MlG5bCqbzEZxHo/Xw5wIyaWOM91qG
 pTDUepdjf8h/PitKszZ1ZAs2EG27YQNRN436VqUZNePBKWao/jC9+JotB+HfIV93ZF0fAG2On3d
 scXZ7Wxtvt0lJEdOSxUQPFuiYzV/lRprGtQuCpCyC88kZvrUZZDOVpVAjpzfuL2WJHTsWnWkbpV
 n+w+ne91y6Dwdc1EcruOX7kKqM5/w3krfjc4Vrxsk0ZXPk/PAeG1kD1/opHTLXcPCQOMDG4iSin
 arNS7aJBz49cWGoxX3g==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4dc00 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8poMKPHdAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uSwIeAtNGuuqP4oK1qMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: hzk387YLl19vB10-qG4525YOgPgtogAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_032713_123404_C6F8FC24 
X-CRM114-Status: GOOD (  12.54  )
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

On 4/6/26 7:16 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add support for the notification LEDs on the HTC One M8.
> 
> Two LEDs are available, one orange and one green. Together,
> they both form a single notification source, so use a
> multicolor LED node to describe this arrangement.
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

