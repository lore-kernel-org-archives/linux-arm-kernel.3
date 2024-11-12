Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA7D32D7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kn+8aJWTkqwQ5EGfRTZpllEjlS0gFyQTELc12l06XLU=; b=gO8MLBiEFIEoj6VAuEyyKcjCY2
	VbxZlLGFG48HmQ6pCHz+TYR+4tewjdOFSvjKEHXWaZCu1UmRR1yQPKw1Iq7KGxSuWjop45Akjo40I
	JdpE3qfEhDBcXc6Nl6p/kvxlRoiYu/xlhTcXsUI+/w8SnpVQhD4sKFflLfcdOp/YmqHxTG/LSQpi9
	6P3h8romsnfyVLtkyu1J3tXb3H2DRzNlfNF/b8u19Uv0ZfWPuvJD0h6tXCCbOUFghdgi2fkKn/WX4
	X7XbQQA/q4YvEWoT7xknORVGM4g95ytC8WZPuE26KTtzHiXjyXZGPc9veyXOSoUMlmxsORD8H5R4N
	4oCvNWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnWd-00000002vrX-1dYh;
	Tue, 12 Nov 2024 09:49:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnTH-00000002vAC-10a8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:46:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so3972079f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731404761; x=1732009561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn+8aJWTkqwQ5EGfRTZpllEjlS0gFyQTELc12l06XLU=;
        b=OYqdRqkeS5JTEsCfp6PRRjgsSAESloq9dUXGNYHd9KHSJ24wAnk3vJqsNvSbKE7jIe
         T6b/Wv5iU/KmyyZ1Np8VCNV3wq41G79sg/Z09ngyrELbR4FXRKXZ9Kuo6uM2kn3JzxXW
         pRBshYt6xDNm+LDR5QsA0VoRqLr8wu8O8z8vw4chTeIrTvI23/14CX22JwOEkvUkvoYg
         9oLNiQRL9H9Pko216voEpkNI4u6y3zGW+fCbPjrRQQwaHpEChEaDIYVQi3KzKwqaFPwP
         ZAOJRpAkQHiSjSXvpMhnu5+YBL64D9rc7I13NL2Qbh1aW0+6LsTxvXwzj1xTp5SEdmfD
         LZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404761; x=1732009561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn+8aJWTkqwQ5EGfRTZpllEjlS0gFyQTELc12l06XLU=;
        b=OiXGslLb3vOa6wtBg//koxWhJiDUN7LELCrxd+rPkNqOEg0c3XheivndI0UQfJ1X82
         is5YzSpaa8coR3+E9zHZ8zKtRBdkO9xLSPBPbrwx50wLpmbjuKlrjDOqCUHjbEWpYb7y
         gs7iwLrOY8U578qZG2LTReWefvvzooZM8IPSjqCUlcwPH6newgaFbEig+ngu+SkNl7Za
         M5FFW8pGd7xHD6PReHoJYyQHoBLgGX/pS423m9Tdv3lEmRFkrd5WHWSQdds4MC/wE7cH
         a3opBBQsHrzqvvdRV3SQaoxxWy4Rp4VqY3FG4bKgwqg/R0vlNyhYyCdrVASATc2cRwXk
         RrbA==
X-Forwarded-Encrypted: i=1; AJvYcCVN7DUttLSLM1akcBE7s1Cv6rPjTFYs5Xjh/c9rqs30SfCI8JTuqfCe0L76JYK8X3mJQkI65Pegv1lYla+2MXD/@lists.infradead.org
X-Gm-Message-State: AOJu0YyduZrspiKNKRxiLhI7mQ/sZpjE7Cb2U0eVRN4iCNzVs+pTew4M
	88XwSLoeFk1OZr9cv9JMAXw7Y0ttUvTGcLDduWLMTv1+7SK/SZvRyAs5nu398zQz8GIfaAibJWt
	vnUjaLHXX5GK3FuiFN1pevU69loq+9DCN
X-Google-Smtp-Source: AGHT+IFPzNA/ykyop8Pr9VmfZCzUea/dWGp/PCJjjDw1YLiQF+EUnfcDBl+zIVNWxL+YF7MTzG6Ojpszf6h87p4+fzg=
X-Received: by 2002:a5d:5f48:0:b0:37d:498a:a237 with SMTP id
 ffacd0b85a97d-381f171ccc1mr13389793f8f.8.1731404760474; Tue, 12 Nov 2024
 01:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
 <20241111094349.2894060-4-peteryin.openbmc@gmail.com> <434b2dab17050643badc60c50b361153631b7cdd.camel@codeconstruct.com.au>
In-Reply-To: <434b2dab17050643badc60c50b361153631b7cdd.camel@codeconstruct.com.au>
From: Peter Yin <peteryin.openbmc@gmail.com>
Date: Tue, 12 Nov 2024 17:45:49 +0800
Message-ID: <CAPSyxFRC-VBVs4xBFnkoBNx1jNjr+cJ_CztmgCpMzqtjYDCVbg@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] ARM: dts: aspeed: Harma: Revise GPIO line name
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_014603_414731_BF1E4895 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, Nov 12, 2024 at 7:53=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Peter,
>
> On Mon, 2024-11-11 at 17:43 +0800, Peter Yin wrote:
> >   Add:
> >     "ac-power-button",
> >     "asic0-card-type-detection0-n"
> >     "asic0-card-type-detection1-n"
> >     "asic0-card-type-detection2-n"
> >
> >     "cpu0-prochot-alert",
> >     "cpu0-thermtrip-alert",
> >
> >     "irq-uv-detect-alert",
> >     "irq-hsc-alert",
> >
> >     "uart-switch-button"
> >     "uart-switch-lsb"
> >     "uart-switch-msb"
> >
> >     "leakage-detect-alert",
> >
> >     "power-card-enable",
> >     "power-fault-n",
> >     "power-hsc-good",
> >     "power-chassis-good"
> >     "presence-post-card",
> >     "presence-cmm"
> >     "pvdd11-ocp-alert"
> >
> >     "reset-control-cmos-clear"
> >     "reset-cause-pcie",
> >     "reset-cause-platrst",
> >
> >     "P0_I3C_APML_ALERT_L",
>
> Rather than list the identifiers that are already contained in the
> patch, can you please discuss what functionality these identifiers
> enable, how different functions are related, and why this must all be
> done in one patch?
>
> >
> >   Rename:
> >     "power-cpu-good" to "host0-ready",
> >     "host-ready-n" to "post-end-n
>
> On the other-hand, explicitly calling out these changes is helpful, but
> please also discuss the motivation and impact.
>
> Andrew

Hi Andrew,
    Understood, I'll include comments in the next version. Harma will
be moving into the DVT2 stage,
and many of the new GPIO lines weren't defined in the POC stage, so
I'll add this to the one page.

Thanks,
Peter.

