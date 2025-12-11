Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E381BD41C38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIXIt+IFeFpXZPRj0PX+jv/KP6j4AjZrxFu7fBe+lEU=; b=p9nM1ZR3qx+Z74lC/+7bzo63Gb
	zamVAjeLdGEV8LmFBZ9nYAH46qMCZ+BNB7RLiZB9cIEWiFpA6yZnEcqyvmyXeADA6Wi/95TM/8FLb
	QEKuQyukzcJIL6PBJi198CfYu1BA29uRlsOwZQBDeDOZ0+NFYpPP7cQHB170u2G+9JEgZpT2G0sbB
	HWlxEx/3UI2RwhYRwZW43E68gET3KXDqJuIKgu45gy8mtv1wn+7iFHH5R/HpkTB3p2reOvjhz8MyR
	DxSOANdKg8IO7mFClrcEJe72d4OC6CI7APdUGv1ezVFjN2GOMJS12h49ACWKQDAe2nLV7rFM6GBxX
	4+hj8n1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh7O-0000000GgCT-37qV;
	Thu, 11 Dec 2025 13:54:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh7M-0000000GgC7-1AYC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:54:05 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b77030ffad9so19573566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 05:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765461242; x=1766066042; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIXIt+IFeFpXZPRj0PX+jv/KP6j4AjZrxFu7fBe+lEU=;
        b=Wi0C0+GZL9nZdgyEeT0JpIuo5fw8viM0Ver5wC5+4VwQ6If423jXHPhvbu5uDy6iSG
         8w07D3HfYvZvKgE90Tk1ndnI/4Bw6RtzJruzGxVify0Vh+8et1lmBZ63r4RyybzkXVfd
         zx/FFzjBlgRKXqU2KRDHdTg90I03BrfY0j50f9U+wFvBA1a2LPxGzW/IXEa+SKosHRIl
         KYZJ1LhsZooSWnKeclbrd9oVzRHwEisElRhSnfDa8lZewuY4q0bWc+frZAVa4AA3LkgN
         AiY6fD5qYu9fD5uOml7XyRQgfuZssdzFGxbtW2FfPa/QD6Bgd2n6fL85sw+dU16T2hRd
         AMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461242; x=1766066042;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CIXIt+IFeFpXZPRj0PX+jv/KP6j4AjZrxFu7fBe+lEU=;
        b=eMr2qeXTvRTZds0sfyfWTp/GEzzuNGjfcuaaAb131P3U75BwOkqos1ZQJ2jB1go7G0
         dgjiRbnarkoFZBpL1zW2kAxDp30m1umABhYoJuSjsHFDQg73AUpzRskp/IheveOooXOs
         l+MCt33RJ20Q1Pjh5UHv30gPjsggyITBo2rKqQGetZkr6WqPeoSkXUKyTQHvE5O84iiI
         nAMVV+0g5EQV8fWPNyCDsxQKxoi8YUJPuNr9NcenfT0yUqaVOPOeMOU8fnW34e3Ab4lz
         WbfJSmARezKybGWaT8JFznHxAkDqT+Ui6+rBAwQu/6+7JozgDmwpYKq8em/1MmMKdh5i
         tiSg==
X-Forwarded-Encrypted: i=1; AJvYcCXuUl2R9gWGs4Ud4KSjaSY/JKqZPtEbo9KGg2MfTxruip/iNH2DGuBnrBfPYI/0DlNU7Fy+BxneYrGVZ538Gync@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9IU+ZWHRHPo6haohBGqb/6I1HR7YfAqH+G4Je0jGpplMiAT88
	G9vSCxYDoOkURjffmHJJG1ZKaWtcTyd8sMXPk1iboDXM3nWdptWgIdVyS0q/ChwZHS4=
X-Gm-Gg: ASbGncvoPtkcnbhFaji9OI68Ntn13TnAloAFnB1rK+NLmlV0aWrS3U+w0gq6zKSSukV
	O/L6vtBVVm1r3FU75avbMAKER1asUgnCGlTgD4pZcnW7EDa9MAgmoDM0sNE2Uxme+/XR3eDiTnN
	QFqy3e90HOoHyYvmWAoGSFmF5KftlTa7l0g0F82FH3byRs3bpC+YiMt3UekhLmGCX5aJPNARH+q
	aotimY3m8XH/m8+0yGiO09BV4OR0biPwYgERD30wnlgE6ykzAVH0KfRRWrL5tAffX4WdWK1lwPP
	XfQ9FsxZURRtt/8vhUaXUglJrR6hpCFFBcfssKpU8VdSqolk/6FzdMhxLL4/Z7g4YwTg+wvJ6VI
	4aX8jBjdMSbTclME0BunBY/ybzaED4wjIq7rMTMhXIGDNR8lL5U3RVntgoqlMPFBPllLVkcag7O
	GsKrG7xsHm6x7v/OTf
X-Google-Smtp-Source: AGHT+IGpApL3VVGRNVrShbz2gpArNfF9x0CWWaOzqj6DXl7ZGwWDs4SYfO44oU/8DNb+tdYYpYB3Jg==
X-Received: by 2002:a17:907:3f18:b0:b76:277b:9a5b with SMTP id a640c23a62f3a-b7ce82d3515mr657352366b.6.1765461242068;
        Thu, 11 Dec 2025 05:54:02 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:c186:ec41:4ac0:f434])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5c8e59sm278436266b.62.2025.12.11.05.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 05:54:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 13:54:01 +0000
Message-Id: <DEVFS1MAP8J6.2263USIPE4Y74@linaro.org>
Cc: "Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>,
 <cristian.marussi@arm.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sudeep Holla" <sudeep.holla@arm.com>
X-Mailer: aerc 0.20.0
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
 <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
 <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
In-Reply-To: <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_055404_336611_56421FC8 
X-CRM114-Status: GOOD (  19.54  )
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

On Thu Dec 11, 2025 at 1:48 PM GMT, Sudeep Holla wrote:
> On Thu, Dec 11, 2025 at 01:14:06PM +0000, Alexey Klimov wrote:
>> > On 10/14/2025 12:34 AM, Vivek Aknurwar wrote:
>> >> Some upcoming SoCs define more than 32 operating performance points (=
OPPs),
>> >> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
>> >> (next power of 2) to support these configurations.
>>=20
>> Didn't touch for a while. The way it is stated confuses me a bit.
>> Should the value defined by protocol be updated out of the blue?
>> Should the protocol (defined by spec) be changed first?
>>=20
>
> Ah good point on confusing commit message. I just assumed it is limitatio=
n
> of the implementation. I can update the log when applying. It is not spec
> or protocol limitation for sure.
>
> How about this ?
>
>   | firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
>   |
>   | Some platforms expose more than 32 operating performance points (OPPs=
)
>   | per performance domain via the SCMI performance protocol, but the
>   | driver currently limits the number of OPPs it can handle to 32 via
>   | MAX_OPPS.
>   |
>   | Bump MAX_OPPS to 64 so that these platforms can register all their
>   | performance levels. This is an internal limit in the driver only and
>   | does not affect the SCMI protocol ABI.
>   |
>   | 64 is chosen as the next power of two above the existing limit.

Yeah, that sounds better :)

I also thought that this was a driver limitation, not the protocol/spec one
as stated in the original patch.

I don't mind updating the commit message like this (but I am not the author
of the original patch).

Best regards,
Alexey


