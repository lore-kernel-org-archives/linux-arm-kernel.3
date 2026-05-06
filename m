Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED89CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=; b=qsDUdNZPB8zOeB+W8ijQWGPdaq
	YQbrMPrTrUii2rumqkP16fPW7PntTFwOtApMfWe2J/qfqbMCbpmqwh7XPzFohYUxb7KtIHzqWJ8a8
	PJOZbt+ftduXDe1Zle4MVax2FgSdEQ9WwvZUbm5sdB3Ck+YNYIRmB25drLEdzfkX92rdHkmodKQw8
	8upHt6g9sLC/Qw4n026HlFvIhZU2RUbDVjNQgoBzz+pyZxKidMOeBDFBCEFpNlQ3trITuN2IUqZP+
	t9p60aQPJ9X9E+EFfP237TxUc3w1WA05QrSvfEU2sdnrWKhfYw7x5ITHn+RQMFxKCIoeB/qd85/8x
	kJs8UmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdye-00000001H4i-3xiJ;
	Wed, 06 May 2026 15:15:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdyd-00000001H46-2pYw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:15:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3Ys61953179
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 May 2026 15:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=; b=Dwz5rLWY775+4mgi
	Q22wMTS63ov5b6rPvTLceOc2RsuzxNkoSpkHl4HRGIuTiLJVY7PwmSxRgW/1LVDJ
	3yo020QHI8nN9zmje/+G/2eIhYHf1X+BWc7KssqN3GeISkjKqTtJ+MEepv04tYxi
	1LbBnw8Td4S6MPW+mWOJyPnYp8ZCtKg7jmU5MrnrJU3dd4l+FFj4Rd5ABDaPslMZ
	Y08y7c8NKBjBgfp0989Bhlcw0uOUpKb0WH/wvZ8SLcTHhzZ/gS66uAiCiKnq4SSi
	QNDWvlHCK79TRakYoXRci/GuzM7eS6Ore80vsYQYG2uw3dz5JfiAO9LjmmWehm3b
	zLhlUQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc150m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 15:15:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575427e5360so3704431e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778080554; x=1778685354; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=;
        b=AMjIA3JOx00hlIw0Z582kMXwbf7G4XaPOTZGC2Db6oFDZ82L+ENqE4k8W4zM4FPyxq
         9xFZlQIMqb6VxGFss7UVP6RySyoXi3SJ+Lk7EDBQ0F7ndyESDwK3vGi0lm8G/1opVOoY
         hJdU9Gp5REFGdPxWPkDdlGvOISEHP+qJ4rgbVEktGQ0TKfausSe0Z7m3gXVHX4pYpPit
         dHXtjVhQhixGFcAcWetbxhEhF1YegdeO8vnAzeFJXDxSUQIOkYQGqLNdSQhDI1965MrG
         ZQG71Gpvit4nf3FVx1qWjdVRfQdpOFaTQNQHntS95cDEMiiQBdO0p/Sjfy6KxrbUmiHQ
         PRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080554; x=1778685354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=;
        b=eT0eAUgAn5FWSJccxYi2dUCNRE4jqDjQmGkQGkKx7uJCgZrDnz/5wH1X8xOt3vfQe3
         afto/TeGXTYSaqU/wFYtwjIRR77frjJUI91vK223DNSTcmyZJH2Pur9ePaZ9UCm+zoto
         qMEMcMoal1Q5XtifukPmgtSYSjKGKUXjDdDXJ4TJ0FvKdbuxeSD+N1M38JUPRQ06+eHA
         YyOgkOMvVjYcMvvOhGeslR0nVe8UFkHXrTXq8c/I/HlGszdLtetgp5Itw2aaThFoRfMh
         7wgpdgwu9kpNblncFveFmIPQ7nNn1dFj1oc8lK3qaV0qSDFDXhJYIpGNXF+18bpGhfiY
         OT1A==
X-Forwarded-Encrypted: i=1; AFNElJ/0GqugWwmOuZEX9TPGVb3zAoDT1ImN5EoYWkFFdmuGonb5xthk0SzatCxUx+SxUG9N1U5lVaXDy4h5pHrMSUy2@lists.infradead.org
X-Gm-Message-State: AOJu0YwoU6Xs4Pz5+4G9HV7OWGggduQfxj+LuWjAm4J/tKZ/OivmMv8E
	sztNvmLEx4WiGVf/BAmPh2aXq7/VVzFVBvWJY2Ca0/YSM0mM94GS/4aU07WwI2qQQbk5GzETlYe
	SqNvEk1OtAATflvtLJVORqYx4LFw+J3ioCVfpYz0Jq4wf2FBArqBu/GAmp3lG4pWoC7oxyZZ20h
	lP1A==
X-Gm-Gg: AeBDietlX7z0j2q7b9y0zvLGMJ0Tz+Q0FiNl5NWhlwMkH1VgG5re/Jb0NRi4SGPd2wp
	BRBMsoaHNqgF6eC/LYYmhKKFrWce0P2F5rVrV55O92GvkMuBHC4bannDbrTkuAAB6hi2KwuruCu
	fsjQSHXEbDkGUT+H2mZiy4dbSctZHng4flHL4Fc2k3HKZ8GaMG5AdBTQ89KnutewcnOYTSonlS7
	kz6iUEWQOthvZvBAK1Oj+rqYVnWIYDqvuru1vNCgSbogMZTL2pc71NoHz/sKu4imx1D/fL9rxPn
	lZMlg9U8MdIWORlxASep62TzG6Jefq4M1mDtiCMQcjNO2VDiL2xrC1tDBOPYqgoKigsB1GOU3Tx
	eoV2a4VXgMaya88AHDucLBbScihUn3JADsR0p2y+FmlKAOrpsQR7hnOu0tVKgpxgVmHT8LIuFN/
	LRlBuFjTXIJrRtW3eOMbc=
X-Received: by 2002:a05:6122:243:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-57559544547mr2328152e0c.1.1778080552304;
        Wed, 06 May 2026 08:15:52 -0700 (PDT)
X-Received: by 2002:a05:6122:243:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-57559544547mr2328082e0c.1.1778080551814;
        Wed, 06 May 2026 08:15:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312daf8sm19383045e9.20.2026.05.06.08.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:15:50 -0700 (PDT)
Message-ID: <c10e73df-4850-4507-8c8c-5e1b5e24f99b@oss.qualcomm.com>
Date: Wed, 6 May 2026 17:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
 <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
 <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1MCBTYWx0ZWRfX92I0xMHIAv2+
 gI9eZkdz28EgKtVCQYh7mc3quwF0GDXuOSsOy2crQrJwQt67rRLWL0lJxry4xekbwJ2Sju/Z4No
 yvwnAm+bwpR/4AmwvAaAy6hiKZwP7sPqYOY2Wxecti9rGOWH6AmeG4BtGlVROqyuCMHcEPHUA6H
 bdzq3+vVDGlTozOpq2F0o3aKrT3QO1Hxtmrf8xEwRUJoNXx0EPqJ0pqbyqZV3iHvWk2ytMdnpZm
 nPEfE7RGDhcTwmnvOGEhtNt7Bc/zezjjPHHJRDaaXQCLB8fPpMonq9Wcv4o5hxHMV8g+23ZfpNM
 ur2xCRyau8KSqaGkuPpXHo2CONQ4JfuVP0imWra06qaKH/3fTSprEYp4UgqnXbkWlrX5YJY1fAZ
 h7UkxVuX1+j/sijpbwxB/voo/EaWLzKNzj9xlco8U2EbIOtUpHNFqfcVBUl60Bxplnx2zjzIYxc
 eOu1oyNUj6enNxQeUag==
X-Proofpoint-ORIG-GUID: 7wyVZOFnMtU6IdBoMp6O3Y9m6RCuf38s
X-Proofpoint-GUID: 7wyVZOFnMtU6IdBoMp6O3Y9m6RCuf38s
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb5b2b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=1akvWiwmLSqBbBFyMusA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081555_729963_99A35EC3 
X-CRM114-Status: GOOD (  14.72  )
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

On 5/6/26 16:41, Michal Piekos wrote:
> On Wed, May 06, 2026 at 01:28:22PM +0200, Daniel Lezcano wrote:
>> On 4/28/26 18:26, Michal Piekos wrote:
>>> Add support for Allwinner D1 high speed timer in sun5i hstimer driver
>>> and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
>>>
>>> D1 and H616 uses same model as existing driver except register shift
>>> compared to older variants.
>>>
>>> Added register layout abstraction in the driver, extended the binding
>>> with new compatibles and wired up dts nodes for T113-S3 and H616 which
>>> uses D1 as fallback compatible.
>>>
>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>> ---
>>
>> Applied patches 1 and 2
>>
>> Thanks
> 
> Thank you.
> I will spin shortly next version with suggested correction for patch 3.

So patch 1 and 2 are unchanged in v4 ? (missing reviewed-by: Chen-Yu BTW)

