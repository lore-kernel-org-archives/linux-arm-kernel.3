Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B14D4335D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcVjILp/caZepFFB60+3XLNmk+XNW05BoJNj51Dg95o=; b=i8RDZMlT5ocBGSqWTVEcCVT3ax
	fS60Cyu8cgyquW2EjTexDSQ9ogQjeN/J+vOfxl9BO3pG2isOnAA9Q+KTlxeiWdbsrCIm7cdoMyWBa
	vVNmoBEHD0fSRPAhYSFWRVY850nBkrCMdloSGdm6Y3OBCFITXa0KDyvruJg8NiXzFSQOwxk8t5q0V
	szxPVVpRAZ7jdgd4b2G/ZiN+zNJIrKXCWyhP5syMFdvTL4AaK1XqeCsuD6y6bCbmtmwoya4MXQ9Cb
	EtQ83E7Wnk2IzLzIcXa8ae4v5gBDmMoi7MMH3ImxK0jX3QUv34IuzMJmAFGBz6wVROURN9nlqehSR
	6htzKf7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92wb-00000007Btr-3CXJ;
	Thu, 07 Nov 2024 13:53:05 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92uq-00000007BTl-0M3T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 13:51:17 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb587d0436so10360671fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987474; x=1731592274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcVjILp/caZepFFB60+3XLNmk+XNW05BoJNj51Dg95o=;
        b=k+G8H4Uq0UFEkqUcl6sbGT/mNr1IsfSFCCJqK3sedCE9IGgeHyVMRS3JC79o5Aiq1t
         FUqVytLlMHBfQb5t/HEyAxX1Pl8Ct9iq/FiCjUtFHaUvxhZ0sXJxHncN5CPDi/760CB7
         P8G8/j/cb7xubYAzfGBWonuegYZLNd4Ac+jo0FEBYZyKecPLViEy3Y7+qPGpslFy/Mge
         CN3BMf0DgaXqjbYEBYcMOT5yX+v0dTVSCaBuq9u7eL1ordbm02bNGZ2c7U+uyUuFNe3o
         6N/U6f/xJN9S4Oe3LohcPCMtVnkTny6miFuLLoSEOaXQ/ciFcRqTT3mWRmc9PkVRO9le
         o4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987474; x=1731592274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcVjILp/caZepFFB60+3XLNmk+XNW05BoJNj51Dg95o=;
        b=BvR440gCQVxfzHBdlNVaauCYgUmRhiY1+TQAOcQ4ddvAMDJoz+oz2idFQHj6Kvi2sk
         QTrzC5pVvm6X/yVuctBtw/NBBgQ0JJZqH1NQUhtLWaFdcpuOPkFOqalSCxVaTou7Jaf2
         dKWFu46X3ID/p1B8nee9/xmiNGX2uctS9it66mnvNDUSKYGrAXSoS2CpW31GSBTaEBGW
         F4rY8ukuHP93KAT4LQf2/HtvZvJk9fwW9xEJCY2gX8K2SOlG3pQCejRAfpcT2r1gL6BK
         uIU4mtj4POKJpQKjBXlTX/PcNV4tjtw9LI+qT1SIUSXwYwOl7foCN/aLesEXFFekCWK9
         59nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfwJGOb8WN2z4mEqg1KTk7au4QAD3ScaFrE7CbW2J/GQo0SomE8mfRSV8q9jSK1gTTT8ING2Cr4ncPSSvTUrXS@lists.infradead.org
X-Gm-Message-State: AOJu0YyKtvI9EmeulZjKNvQ+HKwdhjf9fsFTuL4IZPgFmAgUHjXQjQQJ
	2i9D/faKCEVnIUSwsem1xxLpWsQPeG9LH4wN6+g2S4ygx3EHdcm6jmZWaTi941PGYJeEVwyLx19
	6e/ZNFL00OMnw7OE6NHrdEa8HmF7lPAZTTgKslQ==
X-Google-Smtp-Source: AGHT+IGiWq7PtiVgzCFFWXw5DpnT7owotNtkDOgrZOKmEF+j8eLRrqW6X8/sDWUO8xLANvzfCAOHbn0yaa5j804ukJc=
X-Received: by 2002:a05:651c:1596:b0:2fc:ba7a:c97a with SMTP id
 38308e7fff4ca-2fedb83155emr127846251fa.39.1730987473829; Thu, 07 Nov 2024
 05:51:13 -0800 (PST)
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org> <20241014-armv7-cacheinfo-v2-1-38ab76d2b7fa@linaro.org>
In-Reply-To: <20241014-armv7-cacheinfo-v2-1-38ab76d2b7fa@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2024 14:51:02 +0100
Message-ID: <CACRpkdZ8--4fKxT6+AbYSvTbA7-7EM_HutNVPT7yS90NN1r5nw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: add CLIDR accessor functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_055116_143877_93F21484 
X-CRM114-Status: UNSURE (   8.75  )
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

On Mon, Oct 14, 2024 at 3:55=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Add functions to read the CLIDR, Cache Level ID Register.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

