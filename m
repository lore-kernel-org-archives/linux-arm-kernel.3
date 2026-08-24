Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE016C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fl6brSJe0+fFv2NIJ5+xIBCq87sP/RzIUmJGMjRks6w=; b=yobbmd6bG/fOw77OummVzn32dy
	S+9OvYYtgRKeMJK9pJFjxL6pa0gUioak+mnQKbzWnGvEgZD7LQO3Rmj3cEGqsAwetf/sn1vhNHhJC
	ZTkaxTPIG3+FbkfzlX9nyi7ooqvx/vHUOPbG3Gf6VcUwfVnILiClHmP9rLSsJMPls6trOmrDcynKc
	sv+ZcAKDi0FNKGaoxid/CjBtMm386VuCNjZN2H3yBt3rJeXE8wGUhjbGjaOhyscTg1fOkq4mqqIlZ
	fgpr0VUkWnIaRUuRlbjPkAp4vxYJaX+AoYk1Gzrf5l44F9TkVL2afQ1FUohNCZhqghAtUbKfYhTMa
	9/aRpdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWEg-0000000GrPa-3Mfk;
	Mon, 24 Aug 2026 15:05:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWEd-0000000GrOX-0i82
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:05:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuq9M2479692
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 15:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fl6brSJe0+fFv2NIJ5+xIBCq87sP/RzIUmJGMjRks6w=; b=WQo5YLjbSEP3ewIO
	FMnI97R9N6YJk9la5QGqIYT9UtMW9cG3IztThXugYL8syL/mcdWFi3KFxSgCdjaF
	NkLRTtHpkTxdPxOVsJ6wRh5KWnwmV8Q6tYx9g7hU9iun2AHu9FUuupGaxrAofXXD
	/GF/hUsroSWgFe52OL4A3mT1UaQBcXzXWZxSNqkhyeWWVs7uPu7xcEcl1LB8fmc3
	4aiQt2ecuNu7nv0L8n+kJeQy9fyY6CtXUbB90tBVyXtBFiVvCaaMguqrYa1tZWHj
	EQ7BwG5HtkJkWBkauqMQhxQWuQQ64OzDKqN/1j4IC0f8XWyHBhC2WhixoOCUVi28
	DS81vA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdshd4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 15:05:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c3746cd0bso52633241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787583913; x=1788188713; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fl6brSJe0+fFv2NIJ5+xIBCq87sP/RzIUmJGMjRks6w=;
        b=TnlgtRnatUUVN3rDforv8bT0T3p2BsW4DrPueaaHSk5oVM4FNeLNpjtOxVUfPv2gcT
         LkHQwPk9mmuhuffohP/7SfCJhf9hAUERmn3NoDOKFbBDF4/AWJrIH1S2g5L1zFmuzoWd
         buSnHVw9xTTEIB4bt0hX1cNtVOeB/oi4s2j2sgdbqki83UJAV8LnLT91vAEOHcQKXSw7
         6rZB+FGG5QGhtCtxgJYMqGzoUUy4EPbyr80vuMn69PKCyNCgZZW3jmrlDW1I/HlqT+hm
         oj0GBE+iX0zkjCh/erJytwbP4jKFlo9pnpb67lH3slsKRZiaUCGLaQM76F0TR9u9GWa4
         LzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583913; x=1788188713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fl6brSJe0+fFv2NIJ5+xIBCq87sP/RzIUmJGMjRks6w=;
        b=lGzctoQNHI5vJRf+F7kIJzRTM1Ci5ErgMG6GYhSaJXAh4gwSIMjh+KFZOL3eu4w8Qc
         VBHzNQHqTnfmT5GpPgPazH41fauZM7lfKQmoHse1YDlF63JjIQRcxMhqJRLA4SYT7T/l
         TmSaqdhGnulWKVUP06aQ2MDS5M/1p/NNVeNO3pTVhftnUCWa3/7qKUrzg+t1Cef6E/r4
         IYrJPe28NJP2z/AevJwLkqj1X0Ufo1AS4+NzA3olAf1VkFD9x+zJ110BMwHqEuwoqXK1
         xA2GAmrlnEBW3p7CamtvxaLPJa34Dz1AG95v/OwqqX27kb6Ca20c8uaWQD4V484B4iUu
         TAaQ==
X-Forwarded-Encrypted: i=1; AHgh+RovBNZfNKaYftTp0BWgdgo6421vGjU46gPnezKugIipM32zruPH70vdUPjX2GaKtsdGzJCSmjPWRfxow+2OJV4b@lists.infradead.org
X-Gm-Message-State: AFuF++k6zzs9Ori8jcWBF6Ztc4Ot3uiTEgtGRSUB18cnoikPCqp5maBc
	Z1Tj44Jbyvx/sqW/Y1ljTgWOmtMSXqbHSYMSHDDqnCUfH1Ijac+uHc301gChlOZRJuyXr8uf3q+
	6Ntk1EitiUZAxQtwlVjFqTJVJg2RhXomeJ4UuvgyyewZCMJ97DhHCREtrjEKhF+Riydp7CAOCG4
	gJ7Q==
X-Gm-Gg: AR+sD13gzGMqwCDFvKD3qfOEQJ927dSVN8PFOQmC1uXiF0+x/RKQ01mODl9aIxI8F++
	AHtivwPqu1q/NVlOwFsNW+n/MeKV5jmy0crFXdz7O94HhWf5iOfMr+4Rrgrim07K9wyzQzjnt2/
	4tLcziBq6aaw2CNaE1Xk1ayR2Z7eIrzR1Atju6qxwJYuK4TIgP0JO3iFD6xOt5j/E+kQxCzTyxk
	2dQrhy2ffaYCAyey1InXqukjJ05j9VW0zK3HMC5tK45G3cqlbjNtB0Di2FCy4PeNUQpvhzsQBCZ
	0XBnqCn+zRc9voTUTrn9KVGMQGHP/ddOh5TpXBC1TouFuGEnj+w5n7jcVDrIUaO+LICK+czfyWX
	H+3uSuUm81ynAj9uLFrqedZ8C
X-Received: by 2002:a05:6122:849:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c5ff3f5682mr2692101e0c.1.1787583913325;
        Mon, 24 Aug 2026 08:05:13 -0700 (PDT)
X-Received: by 2002:a05:6122:849:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c5ff3f5682mr2692045e0c.1.1787583912801;
        Mon, 24 Aug 2026 08:05:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1349197666b.49.2026.08.24.08.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:05:12 -0700 (PDT)
Message-ID: <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 17:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX83VH7POF3K2O
 d+HDPsBFAeUYK5pKAm/wwFu/RzlrILyOGXl3W3Wo5ErtyEXENX50oDK0ifGE48HkGq8f8DdRjno
 ahUi97ijoYGvcLr3K1mcaNZgGmxn8w0=
X-Proofpoint-ORIG-GUID: NVvWCW3J9RM6xi9J5iyYY_vXHYRSwMNs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX69a3mUfyzrLM
 OgAXkbJskATNz9cANHfS2iP+6ujh+qdUNh3eQjoviBscerWFqyFSvCXfhiZK+ThDlKJlQeSBzTs
 bfnc54v48iGhG5oHlIgiXCT0kDiQu/Sf2Fp5xTdYXfO3TA+f30T6GnM9nPLZWSrFOUYBFYrZLgo
 q0FEAbelx55vsHEQ78H2gW6I0I6gn4LZF0c0Q8o13E0C3tVIhdMv78cB6H0cqEDTVCbmhi3C5ra
 QFl3DPZ9l709SAyBDmWHjyqU29bfLX7Vo5Ww/4gPlfqzonI21erdFOdiFDr2BLrCrBxI7kY69JK
 iJK9e6au1SIp65Yj6ANt1jbM1e/YQt6TBTYiV6Uhb4SKyMdiKwd+NcjdHuISyM4Y+yiG3C95v6Z
 KpWjf4Vfk8lbSV76bBTVWcpKTQ/1N7x3YIXqf9RRG/LhtzGXJfcZS/OphJxFqyrzIoA+G7USS7J
 oRbnpGd0NMKk+nkUArA==
X-Proofpoint-GUID: NVvWCW3J9RM6xi9J5iyYY_vXHYRSwMNs
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c5daa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=LofuKaiTYX8IWbRp0b0A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_080516_395464_C651A493 
X-CRM114-Status: GOOD (  12.25  )
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

On 8/4/26 9:57 PM, Praveen Talari wrote:
> The driver calls dev_pm_opp_set_rate() directly on uport->dev to apply
> the computed source clock frequency, and dispatches baud rate handling
> through a per-variant dev_data->set_rate() callback that either
> recalculates the clock divider (Linux clock managed path) or selects
> a performance level via geni_se_set_perf_level() (SA8255P firmware
> managed path).

[...]

> +	geni_se_set_rate(&port->se, 0);

This ends up calling dev_pm_opp_set_rate(0) [i see this is an existing
bug in geni_se_resources_deactivate()], which removes the power vote,
but does nothing to the clock (neither set_rate nor disable_unprepare),
which will crash the platform

Both of these calls (new and existing) should be removed. Clocks will
be disabled by geni_se_clks_off() in geni_se_resources_deactivate().

Then, we should do dev_pm_set_opp(se->dev, NULL) *after* they are off
to remove any trailing OPP resources (i.e. icc votes defined in the OPP
table in our case)

Konrad

