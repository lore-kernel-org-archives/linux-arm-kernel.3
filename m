Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABA9C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=; b=WefDx7Vxzjzphte94rCixzWcc1
	4O/regsaYnDuLKg4FkkDfjzxqxKwih4WIhVSFcjlwivscqPFkOduIp2DW0NWsfjHOD/CU8ttzxv61
	8sQtmer7eWv2EFyirxVxRJXhb2xYcvj18HR7W+2stzugSk6+otmJN8bYsitUZmvxtPAequzdCM8MM
	dOgX4LeIZ5+1hY+Qc36fT9ArZ5GTgJIupbOrSSN/1DajAek5iRv92XhmCsPwaeEy6YCzUDvGFVdmQ
	8IjABGwfZWpy4Mu34M2vls77dAs8Ew1gl22ko17sQ/HWCqKOWXweD2DwZAHmwstG345oYFNxr5vjy
	8iH+QCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wph-00000007ZTN-2cbs;
	Tue, 15 Sep 2026 17:20:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wpf-00000007ZS5-29vg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:20:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFATKP4176134
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 17:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=; b=ifTziyLKh9qzhc1M
	h8KULEL9XrG6sJ2Rxlru+TfiJczyUGqhJ13qjf7svvEAifWQjljbmR47S2Hs37ba
	n/gsT3aNTx7fenoFUw7v8edZuhLjxq/u4FzY6RXGs3geaSXMOxDBbFAzIpgimX+J
	JLOlG0YiSh//NFveu/QvVtQOoYJ0E9JLDWgio2kMxVb6nTyQAlsaEbmHIiyXwzpj
	NA83F6w9ZAw53xoTmE67j5FTiUasg9hygKStaKkM+nbAbYJiE8NX+O74ah0Hm3sQ
	aRFUnezZsufP6L4iwstUQISsY+4g1tutYXa8eJeDeCS7WJKNjFjOFZBOQrjxbuJO
	bodP/Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc2paw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 17:20:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so177864137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 10:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789492828; x=1790097628; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=YsIjiStjbNMJg+rU7i5cq2snsshBEiQbjSqMWFUm/u3txs/wSglhe0L0+mva3PE91f
         ETTrDhkh56sgtrxDn7YbPQZdAugFn2l4r2D7ssvb3kSC4obmTKmpKRyeQhht6uUJbvKB
         THYOoS1hVeiBV1IaxKQG94MQPnU+0A9uyEHOKx8bmhvTaBgzAYP7n/TOp9EGO07IfTNI
         GzZ8vskuCDeWjrV3Red+QcpNi9lOioU6hQ5IRnvbbV4xRSFPsKUFjpIG6pHtIYRz17TV
         P+ccEd1jVj9BP9HsKA1HKsZPV9ETZNpQVfglIJwDF0VBTLpvB0jSAmKXz5JXLoiAZT1w
         AGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492828; x=1790097628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=p1ctBl6LoH2aqAoKjUYVVSc0XQYDJxzThnBuJsRCuEh6vzU0Y39zT24hOJE71OM8Fz
         smkMwNTgowJvywzB8xFaHsEKECN2A3OmocTqXs5VKm+nltEQK/JlkNI1n26MuzKEwP5Y
         AP7dep5dux5jb5OBsxnWGGIAAchTC/LG9ZLS37o/A8rCfjKcnEC3fD0NYKdcjLzE0HA7
         4w3RdkNPblfZNlgGkLPp6D2YhNlR9Y+wJcpEebUAe4jxC8qhr7NK87zAGOGfz/UqzJ6b
         HLotF6lgbcXZw9IGa7GAV2MCIq7OGv/XMzqeZGstQWWoGXvC/03dQNw8aO4w+El9lCsr
         38Ew==
X-Forwarded-Encrypted: i=1; AKwUvByDsoVMEyGMdbRi6b5r1NZzuH7Bvx84lByFvTuD0vNMx5Dd7IHvmMk+oiiaUvtU1KD8RDnfe82wjhnY0yNeKEXI@lists.infradead.org
X-Gm-Message-State: AFuF++kIbKNyECUdwZs0fXYCr0uGZRXW0RQ3jeg6+/wdtmq5MhBlhKfG
	iTSycADDeOBlxMMgOxyH1g8bp6RAUXuRltFAiLWPpyGJcBNipyr5tkZHlkZhMfIG/XHOVhrPhQq
	m22fELSpbpoAdi+3k6zpuODM21w68C7Hzy1tA7qrVqbno3N/vvHOZojSrPybUDL7RwrycXTSoMC
	U8EQ==
X-Gm-Gg: AYBFou1eFwrFh3xhJla8L5XuLcEWPRm0bCEoVHgzjkLqQbWUrqVBXASJeA/RZopUkwL
	pqiwDEfXUYb60q73UiB8pTWOvsaAAR8oa/RwZnRpAqB8QxeNm7OwePZaWh2BZezhSDSv6ted9fd
	OOX67uHj3rA3xzYMMTZ3xl1rkC3ZnfMsI0KY05W5rTh+bkqxo62Q7pua15GD6qekqIP0+uaNUMl
	j6rk7IZ5VRdyBGNetHmjySWSTqGlooUECDAuW1Ut8DY+15ynEqK1WJarSrWB6XBcvBmiry8pRVm
	2cQIRxtyMpU+HJ94dhs0Huz2ht92D9Ifb0S1g899xNzc4Ev51dfERRVHBZ/28kKj5NbKwUFVC47
	nazDKimYyAU7rshYRK1ZJsw==
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506281e0c.3.1789492828430;
        Tue, 15 Sep 2026 10:20:28 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506244e0c.3.1789492827984;
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad36sm26023a12.21.2026.09.15.10.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Message-ID: <e55093ff-0441-49f0-9d06-6c100c8107aa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/22] thunderbolt: Try reading host DROM from device
 tree first
To: Sven Peter <sven@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Joshua Peisach <jpeisach@ubuntu.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VMcCAxgzoeM55-2PKbgMwHaBEs0p3g4s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfX/gUt+IlR+MNp
 nl2BChAt+bKPzJ/MKMM+Fd/8ov62DX6lI3t2wjL/CMDcDnAD1pe3RhoP9aaqt9mItH+a9wlBw+w
 V2oj2F/33CRaJpPs9DkQKbqTAr8qz84=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa97e5d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=fxJcL_dCAAAA:8 a=i--5ToJz1EgYGg6QIxYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfXw9gZbQekkE35
 CGzaXB1ezdI/fHq2j7/1wgH1w+iWeZ7onYtZkD5fmZ/K/Gs6kgZtzgseHGpH7ClhJhTzJ4ZfJuU
 4w7d/uVHHsBGYFCTACw42vLKW58kEzRnw9isyOc15SvevHltpGQSBy9uZpFq1G8KMHmrHOS2/e8
 GHkGBP2Wr7dnHR2UPCZpNg2ete7fls6ZXD4kCFRRJbXQIpaWa+4gyymmg6e8d3kUTKYfD11/l+L
 uYzj/Ol7+8972BLu2DQeb491GfMEOinlViVwG6bDajZVS+HnduDs6tVhixuRjYAXNWDMvkiFgRU
 GgZFA6mAhLGF++qMOOQAH2HCIIfo19Ipy62pyUsp8MXt35Bgq7sRbJAjlu2RRLMFe9/xKrzDxre
 dALQqgN1Zeoz9lXjn5DM9+VeK0j30t0o9snlkJKMosLrVDZPcnRAnnKI0Y1Vbv5Uj6CXfJsCVLv
 qQa88RWJkgsO91s5mxw==
X-Proofpoint-GUID: VMcCAxgzoeM55-2PKbgMwHaBEs0p3g4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_102035_561794_B4452377 
X-CRM114-Status: GOOD (  15.07  )
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



On 9/6/26 8:36 PM, Sven Peter wrote:
> On Apple Silicon SoCs the DROM is provided by a device tree property.
> Try reading from that property first.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---

[...]

> +static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
> +}

I don't know how prevalent this property is in your ecosystem right now,
but generally I believe this would be more fitting as a vendor-neutral
property.

Konrad

