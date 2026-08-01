Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7591BC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=; b=QBcs24br20x5OW0I5GRbYOkiNt
	5EfEA/9VOH8TRMvUHfawCrCtyRmrzUqWeURlvmcybGLdIbOHD1GJX7XuRxW6RC1/a9FazVCZ/3kVi
	edjl6OFqaHG6VGlNJXV/KA5wuTXJEyz2NDBgn3GRE3+O2KqsMVIHc0WjoNNuXZSqYcl99PZgY+EyX
	FTo/NnI7le9gK4Pgx0/r0tv8d1numqM4B00nUovCzAJ4Ds+ogFTza5t1Qt/eHaljyUrCHVPNPsYcc
	GBMoxIygnulorS3+PYqvNWmpYWBuRMtR+mfFXhJ9atOfKCR/OidmXWvwxenr4O3/5+uAl1kaQ3uVl
	TRAedCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBIi-0000000Em48-1y0h;
	Sat, 01 Aug 2026 15:07:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBIg-0000000Em3p-0P18
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:06:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Caf8a3122073
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 15:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=; b=Tti3vt3TrlSHvkFd
	k5u3rXZ57tzo4U8XAz+AR4mSA1QRw5R008/lrAzdFOHOFZu1GchPRxKIJvYEOMHd
	Xn7j+jGpDqD9u77cEjywgUuYvQdt6RX5zeSYLl/8gO+sRHl51ZzzlZM/hr2d7gB2
	rvLm0TRFdKDIy3TyK1AL2tRsYxi12JThzlJArmUYEEGWVxNrqVmJ0jBm2dbie0Co
	SUJzpocYYFMMFfDmgI8lPpnHxPVoidtzvHAtQAFVv2tv8t88qj1y3tZ+0h1zYnTu
	VELJzj0sUpaDLyEBMzYDNIy/OBCM6jx2RfH00iN+AA+/KagS1OMA2PKF1r6Nk9HI
	ZXBbKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs91193wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 15:06:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so19425721cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596817; x=1786201617; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=;
        b=FhygNIG3rCygVqNXkxScXauW/jLmtcejKK1rONtME+LsURKUJtAo3U1riS+sj706jG
         bFyL6sYknvtHDRrk4b/Z3OWWdJ7B6eEvkXm90DJhME+32NxbvIqMlsXNITe6qL3vrnfz
         ktrL/APXnCC1PaGmgNMAB1Bla30h+DzB53aK8iWfhDuJatN5r6d3eSWg5hAq5KYZfBHw
         BhNEEhwiXQiIo3iNHlFozCworlzMO7RmtWmYjd/okS2Wkt5Y2y6wymYyk7Mjx5kd1xck
         VrJdAvdk9onOvuyQ1MIKdqj+HnUBGuNJMhJQBrJz3UMtlWnk0YvckTsq7hpG3oY2NY7w
         v4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596817; x=1786201617;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=;
        b=cadsIaVknSfMj2Zcxltf5AYEKSJC/YbENXgPx52R01JL/Z4PeWUmwUskB8fuGIcH28
         YBzFbR0uAT9A4aciY8b4P74M7quosnQ9Vv3B5nad3zfj3vMZWZd3JcPfoebjuYWeFyCW
         /AlhMlutFjuK4GJ2hbxFjUK0pqV02UPNaGC34zAscOxo5DBog7PBtEqIKmahEXrqRvYE
         wu4n+S23ebyx04cPaz9mOoHWo4wtwfkzy4cIJo7yh/fvYUWd4JhP2IzQ0uBTfvwLT05H
         2Qgu+vAV0QNBWhMcFTxUi0fzTn6VitxesioX6f7KFjsfHlAyOK3ukTkwTSeymb3mtmTw
         hNrw==
X-Gm-Message-State: AOJu0YwJR++QZx7Nc0iM3QL7ub7DIRLwzs7MxNnXCgI7PdBI41xQ1qvH
	q9VhVki8GSPHZlWV/Q9KB9e+mZjR8TnWRD9hmCHN+DK3VnKR1RU/owT9C8cO1OBSOAUJOK3gVn+
	b8tTEOQ7fD++UkkCTMqotBJBvVut7Di0fZi3UL+D5H4HSq2IV/G4hZkJzw3n36naoxGbkSpfm5k
	jHzA==
X-Gm-Gg: AR+sD13CHj1YlkgN6PcHZJOpdvp0PLPxVrsVB/rGiq60Xl5SDu8r/TsR7yNAkViPIQK
	syxyWF4wW5MNhaNPVefh7GJWO/SFDNR+vVTqxH4OgeQajiZMhvKindqd3KwcvFnZiUYrVpb7ofJ
	KPLmW5ifcCCvuw60pRPtB28QqTuc8mlt/Z0SqK6O9vrqIbwbtgDaaYS6hl2/r/i3rDtrEPJGB08
	F4HXHJihArgD7+rO9jJWPb8//4Hj5OFqH9rsjfWUvWLi3zoFuAvhECEBMTdOsHhN3L4H4Qhxtu6
	W6klAQ5iIoo47dMaiEgL+vdCt+HHVziN1WHusU+RZA9qANVT1gFLBPdvVQrSpFpZjZ0WqymO91v
	1WRhCeJTerbQexLRYuEBC0zGMWnR5Fg==
X-Received: by 2002:ac8:690e:0:b0:52b:4f1a:5ff0 with SMTP id d75a77b69052e-52b566db1abmr92401661cf.19.1785596816719;
        Sat, 01 Aug 2026 08:06:56 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:52b:4f1a:5ff0 with SMTP id d75a77b69052e-52b566db1abmr92401001cf.19.1785596816318;
        Sat, 01 Aug 2026 08:06:56 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm15979352f8f.1.2026.08.01.08.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 08:06:55 -0700 (PDT)
Message-ID: <a5857cc5-ca3e-4adb-881f-912b6414c453@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 17:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260801-b4-dts-coding-style-strict-v2-0-c0b4c68b2ba0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-c0b4c68b2ba0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX6odiTiYkk9g/
 V7fyKN+Ifj8PubluX5RqqvaL9pRCqYQaV55br2Z2UpCjenAfZtGHw60A6HQ78DmLkN5Mx9cWFP9
 lCffHqZ//oomEHPk88sDafsNNM2m29I=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e0b91 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=96pkp0ENnvQ_4pjiV9wA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ZPNrGgJz54E7tS8QvrtJ1oJSG2Tb0UUK
X-Proofpoint-ORIG-GUID: ZPNrGgJz54E7tS8QvrtJ1oJSG2Tb0UUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX69CvbUuTdL13
 MNCs9LFHnZyPIOtIldF44G5qH9vdug/1XvbAPC3kaiaVafOcL1zQCDQkgAbmfPK4QBTRxjnI1hV
 81XQJO6BhsPwVbAnbBCjJXL+KS4zz2Dxrpvkq/wAamc2uddv/5/2/UNWs+t/qf6CMJd/Pzzc9iu
 xaT1ZaYSfA4Eaxp8XoUe9LzEA52AHNZxVRG5EC/HEdQiWPfPjFIwKeXbqnhRO8PtwHLleFwkzLi
 coxQ+R8uT5QUdXtNBVEkOhTzj1XWL8rd/Gqq/Womt0k3zauI+Gj8e6yIRPgpxDxS9P0Nq3RjL6V
 znc+4/yViEfXfEXvDMmpRCVlci3WuK4r1T7S+tSFS1VhX04KB+YpnhNQo77Y8xpaR+/DjIevQCo
 8z/8w7SQVYou/bbyfPZbA06Nr54EtqMo9GxODNIGkVnJUK/+xWmXjyIz+t9zTAKv197lCBASOWV
 yyd/QArMbTO9PBpjb9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_080658_164035_5467CA0D 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On 01/08/2026 17:05, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix stray blank line
> - Collect tags
> 
> Fix a few obvious dt-check-style strict warnings.  No functional impact.
> 

Please ignore this one, that's a interrupted/wrong posting.

Best regards,
Krzysztof

