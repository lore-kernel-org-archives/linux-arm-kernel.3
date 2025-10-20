Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9C3CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrGlth5fvXPzZeAmBmyPZPRYd5dwsROMF4koS4KTwi8=; b=iVD+PWpGv/RsVc9ggj6f4HLFiX
	6sFGh1vWAxEa2R64F9NCDgMJ6j0/mWNFRo6CnziTVptgi5jzZDYGlRVeUhmavZbsqm42AYcTxZQ8l
	TnBKNDoxB7gRYG/chKtDlykv6E7JkOaS3Cvd/u+S8jlmLZK3A1KrzLv9MUqOU188HT7/I5r/B7MBo
	qfSqd4ice+HzFLg8kyyuThnfOmqxSdQ7diK/bkGu5Sks74uLgELdz4sd+UZov2Ot4iAAN6Z1yuQqd
	MnPgOpJGE0dIQSZ0iMGnDfoL/0GrMfIzNx2qjvZqI/FKBW6I0K27620bbeayOcxDJgJeOjm/Cc/FW
	NAhzE/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxVb-0000000F6uq-055D;
	Mon, 20 Oct 2025 21:33:39 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxVY-0000000F6uU-0npN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 21:33:37 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7829fc3b7deso38506067b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760996015; x=1761600815; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YrGlth5fvXPzZeAmBmyPZPRYd5dwsROMF4koS4KTwi8=;
        b=S4QwEVBBLAxOol8+WVDNe4vGsF/5NQj+2Jl17QllmrSiDWcb5uDRNvLfiO291HQy77
         4G3wqLp2AROQaQLoam7YSdUGtYb7sTwyWQooi6pJrNwwoXbxhoik/VqmO53jZ5xqt1l3
         HejnTD666OVavAasYkub28N7AiFXp+h1eQOLeN3HEUELA2C/9jVIxnMdoT/f4jtrZCpN
         z+NyxwhIjsW/rNffN/Emjt9z/mdvq58s8/abfwS7Z0pdvDZ8awZjtqDsqs5ulXlJHqH6
         VdI4g2H5IxWKvjJwwtTVtHXSkdc9jeYqs8LP1a65xRcVck3I/5NgHJEATrpD04MT64SS
         JMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760996015; x=1761600815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrGlth5fvXPzZeAmBmyPZPRYd5dwsROMF4koS4KTwi8=;
        b=FwC1Dh0ZNL8cyxqtdJEPDHBoDLk6hXQF+2nx9J1GTHbTNGyD89oEAUocG+spilkMyz
         DCIbX4Av2We60wqc/vVLDZZDchfQMrayfv3vtLqhoTuM/GxhBol7+A/wvfex/U7+9M6V
         U9K13uKsOtFK3WiL/x/Q9aZ42DTLos70PD+jYUa+zUdf4KyjE+rdLLPmyk2boA0pUIFI
         6cJlJH8o0lcN00vlcq8smZ3uh83XTIRc71afWrpeZpZ6nLnGdTiCLpPQlTI7pmOgCb1t
         Dytdqzjg15bQApmcrOgd+6zsdrz1q0+JsARur1BhVcrnW1Euar7z4GcBfYoVQAVva+VJ
         IiTw==
X-Forwarded-Encrypted: i=1; AJvYcCXL/izJGM+3aEPbNBilDu5PoPO/+i2liQBtjtTesUNX5EDldJn/Sq5cn3inwZiLW8wzYVLTI3nKJtmYV04umU0D@lists.infradead.org
X-Gm-Message-State: AOJu0YwsmKalprOuA2HU9IYcLI8qr9nyBjFvRf94WVNPgIz/yUfSP9UX
	GMT8JaiDhw51k0Os9K0OjZY2etJWIQKCXtev3PDCujhSxoM2EoiYXIoC8VOY7v90anAIN397xzN
	50PgROjchFlsODSgU0PP+De1bpu3ymbK6r3pbKxxv2g==
X-Gm-Gg: ASbGnct9SX7LSmIGkj1rvTvAhXcIg85Eag4fHlyKLnV2IWBl/m+TtUYMs3C3G5QYiSw
	jak4pVNPkp04PfDM0TC0MdEA+uABPhej/NyspqlZKoPAzU2KAs0Nt8Zjnmm9t+acTEki1JVcnOx
	9CXIMnVF9nAyy6wC2sTXqOJ7EGvuPzp78VNQ/aJSrspvAHRH3RzkI8BEmKRQ4jwuLAkqrbZiKNr
	OhidwJ1FnTrmB2HrdRZlBSinh1Byzlks432CR+FxFE5nHYO16utVPLlPLBbwj/Po/iwMcs=
X-Google-Smtp-Source: AGHT+IGnAj+PvLwk6sz8k8VBBs+rDQFENAxd89cmxP0Cskfc+qbx8RLj0mUzmzdGLHOstur2GpIPaCgQ2XYuSy6QrTw=
X-Received: by 2002:a05:690e:1558:10b0:63e:1531:b3dd with SMTP id
 956f58d0204a3-63e160e3c4amr9861710d50.7.1760996014901; Mon, 20 Oct 2025
 14:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251017074646.3344924-1-gary.yang@cixtech.com>
In-Reply-To: <20251017074646.3344924-1-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:33:19 +0200
X-Gm-Features: AS18NWCltDS_N4NaY0c3A83FgC_-lfyfiL8AVRFFfvMHb2dlUjXD7k7Kzg6VMk0
Message-ID: <CACRpkdbcSkKnwODw_utWEUcwg+Q=_h=psM6ZKphGUr4iPqK4XQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add pinctrl support for Sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_143336_421787_A8AECDC4 
X-CRM114-Status: UNSURE (   8.08  )
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

Hi Gary,

overall this version is starting to look really nice!

Please address Conors comments, then see about the
compile error on the driver itself. The code looks good
otherwise.

Looking forward to v5!

Yours,
Linus Walleij

