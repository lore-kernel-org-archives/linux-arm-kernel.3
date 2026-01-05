Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD10CC79FB8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w52BulNVFU+lzS+SO0meiPZlKCDrq/1WBOqtA2zReK4=; b=Eb/FoXwaqXRQinrnPGK/3vVOF3
	DXgbtK6TlfqLWCABfvEkfqz+vqsnD8rVO7TGAMPfqgus/UK4do83SqHZyRCaT2z+lcVtVledZKzou
	U5OXJBjbzWASZYrfOKGNRCmnpBIO2g8jzmuUlxTgzBRKQHXyShzBnmqpL5lMuiZXQuT99BDy/ZUel
	QxwHPKFq+SZt9GBILSH/7LyojyMbP0CfEYpy50COl4yeUBX/mlQhg4GrT+M2E/4zUynBQ5rXyTDT4
	sF1JDZGxZ6TQKKOGugoXtL4QHPktw7k0TfG2eIuKuYX2Of/ChuRfkR0AAIAT+Mzzi2/1d9j8QgCpH
	+PGLGR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcp8P-0000000Bv3G-1HV9;
	Mon, 05 Jan 2026 18:16:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcp8M-0000000Bv2s-2zp4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 18:16:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605I2NNA3541645
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 18:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w52BulNVFU+lzS+SO0meiPZlKCDrq/1WBOqtA2zReK4=; b=BWdNe6skBfbyahVh
	obkgpomt/z1pLwhVWwvvB3MRj/Jn0oMGSu2oXUDlTmNAaqy3RnfN87nbCiApuRkz
	MJrZ5hLEiQQHGxlp/+oi2/2pcNMGIAgo+UbVXNFDEadhMeHPaNU0KWZ72EISaA7/
	lXCDLwbkBzZzBnv2dLib5m4hQ/XEGXANQuQYKSYtr4+YkrynquB/EXfLmP/NmWCD
	iWfirE/yNHwK36DtiG1EbJUpsyzQkgpOT8/N+6Tv33M6XXhs4R+Nkh/wCYBm44Xs
	mBj2RKvk2NYfNvBWXWFtTCrG/R/zOkUMJEvcnD5vk3/HqXWf4NrOUiftU6rCt88r
	x6yovQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57sjew9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 18:16:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b895b520a2so276329b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 10:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767637010; x=1768241810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w52BulNVFU+lzS+SO0meiPZlKCDrq/1WBOqtA2zReK4=;
        b=DHf4cqk5qJVp/E6fx2DVoJVm7Ape+oKV+F91/a5YOevUXMdKxni8KVh3ifEMBcp7pB
         pA/fdyNxWba27fd+aqd8OYcX+jq0JWVP2zwg+1FMOuNclwRXkepwbkboa89ZCajyaFA+
         z/JGcfYVPXNHyqk8hUZ3jTzv3eWt8HUxJ6383blOem5j5hZptzwYbxSg/9DQcUH6haUN
         bMwCEnM305N1lTB8LHp1NeqK876WAbPO+8zZ2d6SfkilsQl/nWjZZZEOCXZlTmQfJQiG
         GAt2pvELAR6qHV3li1jrpAVJSDR5F6pW2T+3Xyfda1uzDlt9FjizPhiACqKgN5BytpS3
         6AOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767637010; x=1768241810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w52BulNVFU+lzS+SO0meiPZlKCDrq/1WBOqtA2zReK4=;
        b=oeoBH2/n9CI+K9yC6PE38rvyh10H/P6ua4LwanIsWptRRQqZQBkwlfAedWKyy2/G8F
         ezM7d1l2pS5DPzFdOhVyVymCWua37HmFKg65ArVOQ+I604RhU0DMKYqlRmqABtTJSowl
         Gp+4vkGy8eqVJXNCjvXL+o/KfmVlm+xsg7hKH0dOYr/OsZk+CSKKKi2m8JQrdehogeXf
         cPsx/jxBH5mcLykXRFoISUw/AXEMfZWfGiW8QK6QTcF8539uPeSsWu20H6RSZMjjZaSy
         XyuTWTYkmxV1i/BZt16XfKfYEhkU5l/3FYvCpWcMh3c+7LaemZ+F79FND3ie43nq9F07
         ixRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaPp0QW667mR6msgsZwagSO+dwP83MO0Mf9yOJsk4Cduyvcia8kzVNQoRDnZbCDsVAK1fHwVOLgqCsFBKC2Z0O@lists.infradead.org
X-Gm-Message-State: AOJu0YxJCMrUBsO96HZq+ijq4jBmJ1fqmWidgHGsZ3D4qAJB3ycPAfwo
	rLs9nqzxfyO/IqYJK+3ig/N2isB1hZ5ZzuVlQlp8kGBrkqgTVFikU1ICUtQMERnzpJuujq811kZ
	/s9Cy6tAXZtJ3Mn8FhgH1V4SG8YH/1jNemqNvk4lFzO8ePQQaUWwlz/eGZ6mFnMa3F7FmkqxkkX
	CAiA==
X-Gm-Gg: AY/fxX4n8fI4DG6BRuWqolQ1sB4xAlvhfkAhJ2jpyA/hn9kfq6ccx9DWKW9mfLWYADH
	2axegiRi4WjKQnVzAUJUAWgHj/CxfErsB9c50zwJO8gr493q7qtcJlVP0oHJwgALI0QUjRNQPCz
	r97wm3x8CPt61qql8BUAIdzvWVygkAIPtr7N05Paq2W8w1+GbomNfEgm2kT9yMsRlkjKZqTuQac
	hHDghY9OfxUmMkWp9+/xfpLmBVQxIPbYiIjlT4MNDGYmlktyGZVsCpR5OogPZM8KfPVVZpkW+JA
	hSKnqQ8PeOmE5QvejgAoRH7ieg41CdUVhbm8WLRaZ4iKJf3AitDXGFfDmgK2oNFITD6EqUEIiwE
	qZUt27MIAQNQZ0pynxXAn6uabPn3HXlwr8Je7INr5J2Y3bhj8Ym9VhzoJvqAnGXWKwkWOKZCHJG
	y7TXdA
X-Received: by 2002:a05:6a00:3393:b0:7b8:7f5d:95aa with SMTP id d2e1a72fcca58-8188173183emr471297b3a.27.1767637009468;
        Mon, 05 Jan 2026 10:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMHu4SsqjEOd4T8C1y20KfwPG3UOOyJPNbJiN3J0S5bcm7ss6s6QX48g3Cn1Hda5n/4PFdlg==
X-Received: by 2002:a05:6a00:3393:b0:7b8:7f5d:95aa with SMTP id d2e1a72fcca58-8188173183emr471265b3a.27.1767637008973;
        Mon, 05 Jan 2026 10:16:48 -0800 (PST)
Received: from ?IPV6:2405:201:c408:b07b:6589:c739:d9cc:4910? ([2405:201:c408:b07b:6589:c739:d9cc:4910])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8187a42cfabsm385102b3a.62.2026.01.05.10.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 10:16:48 -0800 (PST)
Message-ID: <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 23:46:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695c0012 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VO0Mc1whj1O5pWEdU38A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1OSBTYWx0ZWRfX05SJxsTapwYQ
 E41MAiSYnBXjlREf1gXBVxxcZCSZfAyTBIuKh+UXvPuLTz9YtqiuhUpsjW4gCgUr5uK5hsT38mJ
 OE+8M0RPX/rcDwq6iKn8Bp6rZNUsufwFIgN78pDtr8eq+7naotrU6lSujJdfPP/4e7l9R1aH/bL
 mOGYBpvOVFCWCfqI7kDB9+SeDbxXcgm6WHV/UMI8BzIZ3ISyVHxQFnf2oewb6XIeatcTjSivNNW
 Za/a1uS2aF6pj7hQRrR2LNx1T9Y95h5eIFy7Fbzc5jEAvp+SX9h3H3Nh+VHxEjyOzAjTOLTlEvj
 16kKkWt0Lni7UcEW5WALF8ZmxqchelL47sppo0HxTJtyNtC6G27IIgTQFXXJe2X2arfcnT5Oked
 bqIpIlfUme5O4qgBwIu/0wjuuOTBdKTS0mOHtWWjUagTO/PHsCJszLXeylt7GO0n0O2tTEjOSQ0
 udT+e6dOp1T6K6zRGdA==
X-Proofpoint-ORIG-GUID: 28bZ3pQ0EYom7j3W-bVQvV9ky7jqc-12
X-Proofpoint-GUID: 28bZ3pQ0EYom7j3W-bVQvV9ky7jqc-12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_101650_772799_55A24A1D 
X-CRM114-Status: GOOD (  12.04  )
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



On 1/2/2026 3:35 PM, Bartosz Golaszewski wrote:
> On Sun, Dec 28, 2025 at 6:20 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:

[snip]

> 
>> +                       pr_err("reboot mode %s without magic number\n", prop->name);
> 
> If this is an error, shouldn't we bail out?
> 
>> +                       continue;

This is not an error as per original design of reboot-mode framework.
The code as of now says, if the reboot-mode node has an entry without
proper magic value, ignore it, and, process the next.

thanks,
Shivendra

