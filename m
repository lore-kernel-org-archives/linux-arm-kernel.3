Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9D0CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=; b=fz9V7YBQo9eB52ElFNoCwSj1JW
	nmtFNXvKcfWLU0Wexe3EB63ZDnF2gJtNrui0rF/EnJ+awJ+xMDccUdXAW34JupSPheizYqQ5G4Y9k
	l+QlbtoUcUjZWl8U7/jaPX+7k4coq9Y3uNAfCG9NezlQQS6RBxBn8OP6gR5cvHzvpglJgGrtcoYZn
	fmGM3pkCN0V+IPn6FCvXrnrrCzOtDho4Kc+VXLTYUfTv5GUdrUz6wNBTTP0QAb2I9Jj8RvP3ydwgu
	yfXzvhslhe05PgdZnNrwor++t1fCNbLoFRVROCAh8M9BeCz5vz/DAuHfg6AEX7b8hTeHUkEL6hUmq
	2AJSc3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUYz-0000000Ftnz-2egt;
	Tue, 16 Jun 2026 14:14:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUYw-0000000FtnR-3uj1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:14:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxNYB769054
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 14:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=; b=QAM1kyVTARUAiUx1
	HwN+Rt6ZPoLOrdawDoHFv7Fqdc32iTUYp39m0XzMLGHkpcqd0xkq3fZgHcaemSmN
	ANGPium+D5z1xual38fwaYY0vF/sHhoJ6Qglc3O7zImBcQbIu6aPNpiFueoVY7Wk
	OhvRw2QYbY6ukTECrhwTWbCr+mxQjrvSgMWy9VEz44c4mV8SVxkLqacih9//O6nh
	GDzAvqhArXNn/Sg28e/MY+SsHZ0p2+409jVroHjrIULgFyj+hZFtPLzQY3RkPkRL
	sO9NSscH/uSIWI3FrcEPfDskndnhaRb5hwOjaUv+7ogTIeycvXbhZwIvFzaQBNQr
	N/5jHA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs9j82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 14:14:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c59b44054cso182859137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781619285; x=1782224085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=;
        b=NRUJJroQ515KjzbA5WWbUsqKjDz3uCyNFakWfunFtnofL1hflea/SbHymHPOWlOC7v
         eDvnZ6oRmuoGuqPUnHQO5eowIqup2tygsuwPT2/pARxUGsNMa+6Y/wUUgLFk0z48I0uS
         Ixe5ouNabCorQQwswFEsbxA8YfYKda5/Ab3z6FpmdjHrz87Yd7RxSVBaqtkmWi3g40jL
         GCx3rXrepQos38BdKH71aQM8jUz3gg+WI06+hRVCEkr6Z8o2mXOboT0wfMZjvhwSOHBh
         hVtv6xTtFU0oIizBmS9gWm9hCDZRDr8J/samJu5kOJE5Jh2bN7r7pIRpNhZ7NSeJs2X3
         muxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619285; x=1782224085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=;
        b=NhZ3ue8k0SVanODGf6DLcnPrLKgTnXZ4n8ylpiyNe8K0dRuyAL72DU1GU7zNYklbGe
         obKpzkpWghqnAfpoCno/+dGGf96HlTsiLs52OV4W4ChpN60El9nbiADuT4/57R0P8I0w
         XKsIs5D9Fit+BNtQjTa00OjV47O9Zn9+je0BuCxKUZoMG7e1C9z0cPkvcwGqjhvdfhCM
         VvcfrjcSCBY9cDv0X3tEPNnoNCJDHpKa7oOcaLsFfeb0I/p3TiESEyKA9436iKe/ccG+
         +hbbdJS16NnNoWE0mcRmXQlIgzol/4+Ros4wXfkybptHmrreSGp0h8IWGxUbxSjKpkhU
         AQvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ap5uEQXl06Npz6v7kKAbDlZ6c79Az0mVhQuktpxPRXhLpV/tpvxZ/Qv3O+qiHCC6lUP3Z9oyjV0ETuAf6O5C/@lists.infradead.org
X-Gm-Message-State: AOJu0YywMgHmicOcFoBMr1j2VM/dszYSRYBzpJCvT3fAzC+bYVQ+ribj
	53TfHOVRUzXONQPbQz436HOxjhg1ap7sRIQmGtLDuR74tcEhFePAw2dd8Eb7Lc+6m2wQ+o4kx/d
	caPTRbYmzVJiJ+bOIoqbj5eZ9D4ZQ+1JI+Qo+2MUFKeJxR6kEC8Xl6ENAC2s0Ig7ryu9WWIAlhx
	7+mQ==
X-Gm-Gg: Acq92OEFP2HSZn9aOwGmKcYoWi55fQMJIYcxIWrADX4kPhjk4thTTOPBuJ/PFrxNB4C
	CUK0H9W7ag9mbRITINYcOo3O0PR5HdM3x1Www4a6vBWn6zTI7lMYKT/OXBXrDAUXf7EWQYYiEBU
	vjsn4cmLjp6EkxqdbpqR9adqqSTIRQzshP9bqD0DgJ7QRiK4Xne17tSVa/IGNxt38VzpAfpq7Sl
	VuB3JdJo+mpZCMwmE+t7I2EnuDWKHcvtvo9AKGPQoFBnDwouP4v0A2Hec8yyWxBD/5IVeTHfogr
	bwpPbTljpFpwIcj5O3VuXXTsK0QEXcVZimIE+IHk4+wvnLsM29h5z4Fm7plbnJuTp9fomnf6O1A
	N2JJTYFVQG7FqrkPBJ2yeVP0z6NL09ZC73c8W2o/Fd7Cclg==
X-Received: by 2002:a05:6102:510b:b0:631:4d32:a86 with SMTP id ada2fe7eead31-71e88e3f21emr2770722137.7.1781619285153;
        Tue, 16 Jun 2026 07:14:45 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:631:4d32:a86 with SMTP id ada2fe7eead31-71e88e3f21emr2770699137.7.1781619284575;
        Tue, 16 Jun 2026 07:14:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d8c2sm638601966b.38.2026.06.16.07.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:14:43 -0700 (PDT)
Message-ID: <50f7eb11-7bac-4d45-9e0a-b209f7e8e9f6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
To: Andrew Lunn <andrew@lunn.ch>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Eric Chanudet <echanude@redhat.com>,
        Lucas Karpinski <lkarpins@redhat.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V2ysozJkUZCLKBsr5S27PURPRGlyOWrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0NSBTYWx0ZWRfXxsiHmB1klmp2
 MJgGnao5rimIcLklvj2sMJB2YUhWF+KpZy4i1ewujfXSKZaKJWdQ+vqAH9rzddVFuLXJ60ifsHA
 sKqzfuDCKkyPQeQNocufiZ3Zgve+T38YJw8wkCnR2KrQgiJIGsF8xYQShGddr1i8B/DBC21tUWo
 QKPtJh036wG1jwZKRY3DoD8IzwWjbWDTOTw5PSuqc+1UrQc9uXm3wzIgCMsbR6z7180GI29V4PN
 KK+PsIRVyW2x/qWXPlbnBUoegTd8fMRFZuDm1c10GP7TXjvVu9qUuzdc7wmfejysI6ItcKM2Ig2
 Nh/WhLi3X99A0glPtqpCXFR+tgU1e7hrsOeYktUX8k0WcVWgaJcVc+QyR8C9yNs+b5t0tS0OFmY
 46Mma6f1BtDbZTqqFBKSeXffFQe1Xim19eupzDFaqwNjeSQl2H6zc89L50Zzrxpzmdnethtqj5j
 kZPcT0aWmiC6libpxGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0NSBTYWx0ZWRfX/X6XncF7nuN5
 mnp931/I1Jlh87EL2VxWjbOJ+8h/xv66Dz285AF/QEffgzBQ8TUucctVYmChN4ZQhoHn/tZ1xPg
 Q40I7cPN6T8GL3VYkMpSggdc/4yZOso=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a315a56 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=RaRby332RutXx2QLMF0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: V2ysozJkUZCLKBsr5S27PURPRGlyOWrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_071446_978312_4047C364 
X-CRM114-Status: GOOD (  19.50  )
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

On 6/15/26 6:48 PM, Andrew Lunn wrote:
> On Mon, Jun 15, 2026 at 09:24:07AM +0530, Mohd Ayaan Anwar wrote:
>> Hello Andrew,
>> On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
>>> On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
>>>> When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
>>>> the MAC must not add its own.  The driver currently falls through to the
>>>> generic DLL initialisation path which programs it to add a delay.
>>>>
>>>> Power down the DLL and set DDR bypass mode for RGMII_ID, then program
>>>> the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
>>>> ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
>>>> 100M/10M, and remove RGMII_ID from the phase-shift suppression in
>>>> ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
>>>
>>> I'm curious how this works at the moment? Do no boards make use of
>>> RGMII ID? Are all current boards broken?
>>
>> Searching through the DTS, I found that we have two boards using "rgmii"
>> (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
>> "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> 
> So this causes problems. We cannot break existing boards, yet it would
> be good to fix the current broken behaviour.

These are a funny bunch.. QCS404 is a stuck in a perpetual cycle of
"no one has the hardware" and "someone has the hw but zero interest or
time". I think we've considered it for removal at one point..

I'm not sure to what degree the two SA8xxx boards are used. They
may have been stuck in some sort of a limbo. Maybe Bjorn knows?

Also +Cc some of the folks that contributed to them in the past

Konrad

