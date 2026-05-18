Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EACCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51UEAf2XGrgb3sTNi1xRNy5C5WRe9clSdlI0urQKEJI=; b=GuG9JOpQmTgJIN1ajq/0wPX1q2
	x4a2q8Wx92YR+j5YK37vowm2Vts4Kp66XG4sXQ8tlanSwJ3JSia/rggeQ/GntIKDWLTGUFl4lhG3U
	/exWa6xpH9dfcmgJL6fKBUfP/kuutgD/Q3FKsYGYmGRP2QB73Gfpy1iZV9VnfUEOr8+KLwJgKGQM9
	x8hn3Pl2Oim7xxeucSDOF7PSky8SSmmEtRaunkHQNgA4EUBYYCh1WukAnxoqc3T1UyIh4WfwrffdY
	iWQYuOjNWvmTPSbXl1rYsrjbhtOZFn1GFa50OZNGVQCjKwR4zaR5BExG0SUbSFFQ8SaISFKpsgb6g
	W928l2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvV0-0000000FIvJ-1f9f;
	Mon, 18 May 2026 10:47:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvUx-0000000FIti-1RAp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:47:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44a14580111so1547826f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779101217; x=1779706017; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51UEAf2XGrgb3sTNi1xRNy5C5WRe9clSdlI0urQKEJI=;
        b=uuq2NChekvPXeVfeYmEev7/ON6exPY7K52lIMYVjBPdHwj1neyfgsmM92JAAFfxLyL
         ikARFEYdOwy2TFjFmcm4C4xZyk1e7Ewcr4YaEBrpLCP5x78LQAOUUWklNRUAJd7Eg0t0
         NVQa6cJNVx8itfawHmOJjzx4S+MZjgozl3mIS7qXm6N/VuP4fxMPQdEyG7rdSLCxiBvq
         td/EJtYyueMLCOMmT7HKNCB+JZdJa2cl6+tGrb3s6VyblWwX7m7vxTitivdQTREfhFb0
         2FiSba+XhQH4FWHN4vY3FJx9yli0lnN6knO+wPidTTGvtqxUOTLoZnj4y+y2BRfhDVkC
         lCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101217; x=1779706017;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=51UEAf2XGrgb3sTNi1xRNy5C5WRe9clSdlI0urQKEJI=;
        b=GJsMyssgHLek7/LorasH9njRNVrsh9nK7U2+0i0KUl8EE5H5KVP6kGzy8Q5P7pc6IP
         w5sm18LNUZe7ldnvvf27p0k9zAVGpksigig+Obswx7zeNfuR1+M/MA9y+dPm8s5UkdNE
         hIPXBc1MgYy/yo89liHDR78eLRl5k34ch7F0pZjoFsIdVojBnZ0to+qQRbgLP0IKIvcf
         d1NceDjh3uAZx9RqJbPPmHZFNQCDXPkw3+haegdEkUer9+ScACBwv+h4sPzV8vyhzfvl
         5221trsp3PVpc2aJ69WsU5+ucEIZ3L0bsi0Ta+aT1GUfbOtoRdSZCAVLC75D4luaq1pj
         DNow==
X-Forwarded-Encrypted: i=1; AFNElJ9qNbPObUnwTq0Xa7ZAWQRmaDEEFten0w/Kl2GtBiF8c/umAAGH2uB1EYK+PP+1lWPvhlccWuSSlpw5z02Hv8sm@lists.infradead.org
X-Gm-Message-State: AOJu0YzHaDAsRnjQEqSPiDJ+mIWUcb47NKR0QtILypwQ/yJbfjMCU18c
	+rrcvvwAcfChq6P8ZGc1zAeUN3ZBX1Dx682mMdHSiGlvkqTGSHfZ7x4GP4lnqsC/k8E=
X-Gm-Gg: Acq92OHThpDoenhFxG81z2dhFHhJt9Qg/LCAYz3G6NFRg5P+36UKNBsnendArFCrbho
	ZFvakh/x/bp9EBFCHutsV4m6s0m4Zn3X5yn9VOQdMCCjcGagCaFh4uHT9GP/o/xMekjuMe4wEZB
	1BpPthDFOd4+ZSb+tq6y8uhG7JDPOIyAFk163oboSA8pLelYl+X7tQ2HVST/vXwqpBflhbFSx97
	qSOn9RQYL4gS3Cjf28Jcd/i4Vm+/6uO6SoEocWR948XH9Err3AP86ScPqF6wADHlb7Rdcqi831V
	iL/d1KIAj5sNOK8R5ieiRB/SHBs6YVUvT+Jsje+gyLsRYGl3xFoJTCaTGukqA7c4Av0FM3y8g3n
	pWnx5syPl2zhA/IOylqN4tkG3Z1wD0+KZwfZsmJs8umVyBDLnOsfaxZRXu6R0/7O2nHPkC1syJv
	8hDNHBB9GSwNMbIJ4utJNoX6weDFfvL1iHiVDfr0Mx0L3E+xLd9Ax+/COEGQcc7yYAv+Jq4nhdB
	5bXExEuEWr9FCcuZKVJwyAXQWr0
X-Received: by 2002:a5d:584f:0:b0:45d:484b:ec10 with SMTP id ffacd0b85a97d-45e5c5bbe5cmr22863944f8f.2.1779101217129;
        Mon, 18 May 2026 03:46:57 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm35777201f8f.30.2026.05.18.03.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:46:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 11:46:55 +0100
Message-Id: <DILQQVKC65OW.105KDQXOG4PN5@linaro.org>
Cc: "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org> <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org> <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>
In-Reply-To: <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_034659_431333_15579201 
X-CRM114-Status: GOOD (  11.17  )
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

On Mon May 18, 2026 at 11:27 AM BST, Tudor Ambarus wrote:
>
>
> On 5/13/26 2:12 AM, Alexey Klimov wrote:
>> The Exynos850 SoC contains an APM co-processor. Communication
>> with this hardware block is established using the ACPM protocol,
>> which handles IPC messages for clocks, power, thermal management,
>> and PMIC control.
>>=20
>> Add the "samsung,exynos850-acpm-ipc" compatible string along with
>> its associated match data. This includes the specific initialisation
>
> s/initialisation/initialization=20

Why? Where is the error here?

Also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/doc-guide/contributing.rst?h=3Dv7.1-rc4#n176

"Both American and British English spellings are allowed within the
kernel documentation.  There is no need to fix one by replacing it with
the other."

Also looking at git log, plenty of _s_ spellings.

>> data base offset (which differs from the GS101 offset) and the
>> "exynos850-acpm-clk" device name required to properly instantiate
>> the clock provider.
>
> The patch looks alright. With what client did you test it, cpufreq?
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>=20

Thanks. As you might be aware this was tested with acpm-based tmu
and with dvfs/cpufreq both on e850-96. They are local changes here but I
can't send all of them in one go -- I need dependencies first.

Best regards,
Alexey

