Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2831AFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFEQeqYDr3vnx+CdaU4srnuC/dtlq0bO49Y8PJlmqAU=; b=pwCCAS8mowM1l7fjm5TOWXXpY/
	V+bivt22steOYqccLQNAZoeguZw/axvwjsxDfGFSAp4+NJb0JqjpID3dqHguGRJHSM66f1zwYrCaL
	WW0pHtXuIIZoacIWSHy9ifElb3W5fdBwemFOyBYKB0BU0GynI8GS0/kWMP7F/xgOxFzDltXYQveN0
	6j85guDU8zQWQRdTaIe3h98Xr2/if03mnSN21Z2+9ZHN571OcRQvEfp0RM2Noa/70acZxX4wlFqUQ
	GlqavY4qM3IXwbThx37V3ziyyUK+0+374dyn3z0dzuRnZBzf9d4kcVd+caVwNmDlv10C1AntGIYL3
	tZCxZPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7Uv-00000003tYh-1nli;
	Wed, 29 Apr 2026 16:10:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7Ut-00000003tY1-0UoC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 16:10:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCeREd316843
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFEQeqYDr3vnx+CdaU4srnuC/dtlq0bO49Y8PJlmqAU=; b=cZ/Witblgi6EIXKS
	qbLMR/8oRr23GtyI45c0j39vYBwbeHYolz7VXgngtSVVN9so1MoXHt8hzNY0LVNu
	2Hxyjce0Q+t4qLd3Hco9LKxXJReg4MmcK6iaEdwiDdNp82Ekb9teAJfsGwk0kQJX
	/lfBomu2tcDL96kUKW62mWcmX+yYL6O4xfdDQF3jOQ+/+dF31p7PKxm41eR5XsA3
	uQcwFycHKTDJ3MokteQ05wITXxc1uvF2sOjxmzdKyXNpdLd+xsIYgEv/lOGRXPuV
	PRIqXu2wMKgV6tnBWeYthWK0q2ADut09i2ALBhuFLL+lyf9itLbrQrleYckYIzBf
	nDqlBQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t8tbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 16:10:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso1046319a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479045; x=1778083845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFEQeqYDr3vnx+CdaU4srnuC/dtlq0bO49Y8PJlmqAU=;
        b=Ml9Vv67vpVxr3NtJg9reoNYQ0LZ8Owp1yq2HkZhsGg1a/V55QkTy7JR2OJWZvPoncS
         UMUofwupxuoF/D8W2DRMQUagcF1k3CxcSi3k770z95qX7OB0d3E9Mg8MsI8wGlNp4m7F
         DTPf52APxoUzNnE49hChKHIQfRsJUqVFI3OB2pcYi/RXWiZnuDinT5R0qk/0noxg7n7G
         BpBVmNZjQ5cpfGQf1WOGr5W7DPMaJZWWwA1BsDyBLLgafNfntxILTSDaAdnLZOZY/SWG
         jchuVtPkOrTUKilDhHMFH9k5bEKOkFe4D4gYcBq1krd6VMUGz/T9UCMONEwAbdWRDkyw
         A0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479045; x=1778083845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFEQeqYDr3vnx+CdaU4srnuC/dtlq0bO49Y8PJlmqAU=;
        b=KRFzarqrS/hcWFt/JfI6mHX5O6kfjFdkrvsQ4ukcHR/iDsO29AgCFaYopI0EvMV4oE
         ADOFCFkrBh5yuqU9WfDndv10fje+ZnEYqSLUiy1q9TPl3erza2ezXXDfGAixcNt25cTn
         x5a0TS1fBPTPUm1l53CCqi1ARadWH8Jnh08SQFGorVKWkbhb0WJAscXiHsApWbOVhcV/
         Q93nnVHL9qfTWOhZ1c8XyClQl0Bw5dYrb3fXAva1DgVSh7UVsL5S91PKvI+ow8n7RXAg
         YGfvRP2mMuLRdAhmHTB3e6A5QLIgH6KoztpI/X6C6TBIBIsKzBplLeRkkO+MemthjRdt
         IjmA==
X-Forwarded-Encrypted: i=1; AFNElJ93PX7fz7lBtXK8lgIbXUWvmHn73tINl8pbOFnWwA23WBwsYaXUlDYDL60mGxcMHwmOTuxuK7aAAV2lk/CdVlnu@lists.infradead.org
X-Gm-Message-State: AOJu0YzO8zFKl/uyxgP5BmhPrDDcBZU6EhV67Rb3c1XmALn73N4bLsnq
	LlmcMCkwZvaudZeAxI5tWg0eDcOyzJJHUxz/Mxs/g+b0VsK+ZXjV3IsbkQvJsFPLp43WhozkPwm
	GdhehEISW9XuiJHPS5A4fEA/4bHFh35jZrW3OkHnNkcQoKkKULoP750WffanRSud1nOOOF2KWWJ
	qZxw==
X-Gm-Gg: AeBDiesJ42Mps3UigWFfoZdvS+7YfvSPfYT6tpw6PjE7xB3uP7XfZRANWq5tQ/zQKnh
	fJ9pfOaUa+8qU19ws0ia2MsUeMEh1oeVxApHIZ5mF6EhoYRLyJXFlM7PxkF95Cm+emd61/2EM17
	nMitCpZYcRn1mMSF9bkAusRu25pL1q/x8AgNBdXNM3OgbL7jTbfrq4zx36DpeE2ZPJbpmbb9G3b
	db8tRLFlnM+SCz46oz2JvvyTN6adGzFyIKQOUpO7AuN+fUvu8DPM2WzjzEErESz+Q4YpJrjWTKB
	MbZTmsM6n1aCUMdo4EcvRmossTllAcM64oGXf+/TfF8CsULqItC//+PqiOTrudpm7+Hibm8H0qT
	LZUn4fH1ZS9W7jRNFmhp7uM/dl0hm9gPihg/E4fASMVF0EvDMu27gPHARVDdMlg93Iw==
X-Received: by 2002:a17:902:cf0b:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b988368538mr33084365ad.2.1777479045159;
        Wed, 29 Apr 2026 09:10:45 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b988368538mr33083725ad.2.1777479044502;
        Wed, 29 Apr 2026 09:10:44 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b99852135asm7875085ad.73.2026.04.29.09.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 09:10:44 -0700 (PDT)
Message-ID: <37ab0178-1c9d-409e-bbaa-832f8075afa4@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 21:40:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
 <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
 <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AnQPIvuaCdnZicvEuBbNld8kX2mHSD4L
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f22d86 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Y3Rdv8TwbQrKP7QTPRCa6w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KxIdvRQG5D7s9ip59WoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: AnQPIvuaCdnZicvEuBbNld8kX2mHSD4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MyBTYWx0ZWRfX39NtXfmRupp2
 9eyinzcB1S2bfTcqzNCWQnmm+gFAZGotVy40Xrpd3IK4Hw0Hsbt0GxJqAEswb0mGDiF58RfQdnH
 XjZZihDlPUZiRjxHWBMzier3ZetQHOK+UHr0gpgdguryOyIongHBT4V+0hO0w625806YmMOeeR/
 fgQA1+C1dAVmtwgAtTv6c9YjlQa3bp22FX5G6i0EGNjS/EOipP0MUJ0koEzPB8k0XV/GCQTdVK3
 C3Az73Q7uUpsNrrAELlu575j8vbrzYpJNhLZyLQR/Hrjwmg95AaYrO7a/R+IUxjDqUQwQ5BssjA
 Mp3P4TXuSS2yssupLP0yDazhqLjF9NvzyUzO1cEmvsMyjtUSCWk0DsWbAGo9WqooRsHDSw3BGhH
 oLpQdJk+n+T3qpU1K2BpSkIFwl4rKAs2X9ldw6yttLNSxJOXn5MXsDTi0EWfqFbsy/jQQBCE15Y
 THtZ+GMNHl7SJ246CIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_091047_208073_0E120B98 
X-CRM114-Status: GOOD (  18.56  )
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



On 29-04-2026 15:20, Bartosz Golaszewski wrote:
> On Wed, Apr 29, 2026 at 11:46 AM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>>
>>>> If set, it would be called from MFD core and would do the name lookup
>>>> and return the fwnode which would then be assigned to the cell device?
>>>
>>
>> Or should we just drop this patch for fwnode in mfd-core?
>>
>> Export a new call in reboot-mode framework as:
>> reboot_mode_register_node(struct reboot_mode_driver *reboot,
>>                     struct device_node *np / fwnode)
>>
>> Use the parent node in psci-reboot-mode and find reboot-mode and call
>> reboot_mode_register_node?
>>
> 
> No, I think the reboot-mode device (as pointed to by the dev field of
> struct reboot_mode_driver) should be associated with the right fwnode
> from the start so it should be handled in MFD core.

Ack. something like should be fine?

drivers/mfd/mfd-core.c :
+       if (!pdev->dev.fwnode && cell->get_fwnode) {
+               fwnode = cell->get_fwnode(parent);
+               if (fwnode)
+                       device_set_node(&pdev->dev, fwnode);
+       }

drivers/mfd/psci-mfd.c (goes next patch):
+static struct fwnode_handle *psci_reboot_mode_get_fwnode(struct device 
*parent)
+{
+       return fwnode_get_named_child_node(dev_fwnode(parent), 
"reboot-mode");
+}

--

thanks,
Shivendra

