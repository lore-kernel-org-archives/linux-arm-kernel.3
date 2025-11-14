Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187F1CDE006
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qf7oM2oFrPrqeIGW9RDJgG5aPYxrWcvRZEha2f7Gb2E=; b=MhS+rfsyMox1BOtjG38ZH5mznv
	Zoqfj0Jgzhvv95yGQBpYIi8T0YA988GehJekDXMpGOH0+ipG5oHlQDTPBYl2BBPeG78XTuNbnBMEZ
	XWvEG9ZnJG4Qh2rY2gcpSS//XqjCXxmU0GJKkDw52xOVhL+BRnwvVJlFfGIGEYIYQlV1VH+oz5Jf3
	E5GpvSFLgJSOpS8IHWv/2d2w65fkPqnXPCvOnOIw+Zu+9k0+9lJpAUbhNviLqpbjIOfuOX4Yr8k0R
	8fjkaDEvlAbJ0LcxqWFiAGF/tQctpv1zi3Da+HPeMQJb0fObmzmNSlY2aFxsjGHPxmzgJOtz8s30r
	fIuavb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnuv-0000000BiZR-0X7z;
	Fri, 14 Nov 2025 07:08:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnus-0000000BiYh-3QWV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 07:08:19 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso985148a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763104098; x=1763708898; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qf7oM2oFrPrqeIGW9RDJgG5aPYxrWcvRZEha2f7Gb2E=;
        b=Vr7bH8YVunKOFonYR/5LYdfYR/RBkcPjz47w+wsOCaY0e5tvXvwKsLEUrRIjoPmkSA
         luz+nY1ovU+j/Wg4lk/AQHXC6iLZIj5/hlGZXSB2HvnNta7bIA/Wzj0L/YD5N0KAgPny
         ulEfK6XblKlRDOqjX3aobi3w/RzzHmBZOgI36Iu9AUSwHvdP34c9KD7O4vXrS3g/ePb8
         3sQkjH7fVlZ4y6EjXEAXwjxPyBEYQz+ivtiNGgYPCcs943J2MSX/+iExWcxxdUtuT/Bx
         qTZUcXxVfZ/OMBCwBCtzGNZO6wNFm0ij3mNxtTO8YEuU+pFH/IR30Um7zXnPBfxEu0oL
         5HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104098; x=1763708898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf7oM2oFrPrqeIGW9RDJgG5aPYxrWcvRZEha2f7Gb2E=;
        b=FlfVQCooiqmnB5X9l3v6JOYWykmzNXKIS/x2lAYnvK8xDiQ3PidxXynEfVJNABgQS0
         0130ZuSSIXTN7WgC1wYXRxrmVECfD6eecI7rWwJVhwwU2PrADW4f+oM8Wi36KYEp8v+e
         6wOUrrG6F0hHKx11lf5tNACiD5HqfX5h3BLIhsQ6kkgABXYBb+ljRIfgLHlaNEj0n0UH
         lqW0U4ebTqS/MHgHQOxA3qDDoHXBeCW07yzBuGnfeRtH3e74ugV9B1VzhvTXXHhBVxuC
         cTmndZdNj8mvwy5JuXpG5N1ZnZH/Ab5YqkrQthATRuxf0XTisE5GDJrLaiCV6mXjNmvN
         NWJw==
X-Forwarded-Encrypted: i=1; AJvYcCX4N4g/OAo5AKyWbmLrfSxPl1212sR8f0Ydm7qRCjK0s0GPP3ahISZMSAe4lZ58r3UsL7CAxT5b5t+Hq7n9kyhJ@lists.infradead.org
X-Gm-Message-State: AOJu0YybXEQPkJh9JtGe3balp2dHM4NacpPzTYcS3FXEhDjyUvQqMofb
	cMceRt4bz/489/mgcpJwszsJ59OV0fLWLZBATlkKX1Jyz4H7+/b2r0J4PBx3vW/575u9UQjj4O6
	/Ad762brB5akYzSAbBfzMxqM90xJDbwYOXw==
X-Gm-Gg: ASbGnctoYQ4/5YVs6k3DCM1R0h120EFwg8WDkgrNsI/ul/2jnag7eyJjym5iIvy7VFm
	761UigZzgWxrO2NStyUrpnuEs6i36rZAn3uvS2Vh2moNUnSL7DzuAUGmBk1wYRqtMNImaxur+fv
	Nmj9YexKsFyRXn8MI9h7VZ8dtE54N641qJebyOAuTukxsdz05ml1ns+SL+sPRtyD+RgykIgLXvl
	Cfi3lHD2b9vFagK2qXSfm7/zQIXgxMGMJJlMrI5TFko9WGsezr/SCVbVw==
X-Google-Smtp-Source: AGHT+IGsymkdPfMwkbwCyj1YqTZ8hznop11+TfoGs9/58g0chCF5CQB3ik/rPsfU2yzT2kReqKKIsszp14r6geGb8DM=
X-Received: by 2002:a05:7022:43a6:b0:11b:1cae:a0fa with SMTP id
 a92af1059eb24-11b40b29828mr900544c88.0.1763104097709; Thu, 13 Nov 2025
 23:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com> <20251114-imx91_frdm-v1-2-e5763bdf9336@nxp.com>
In-Reply-To: <20251114-imx91_frdm-v1-2-e5763bdf9336@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 14 Nov 2025 09:10:40 +0200
X-Gm-Features: AWmQ_bk03ec5WXYu6zBfKnpCmf74S7CEbVFh4TSdNIITolMj2aLH-CXkG7tZ5Lc
Message-ID: <CAEnQRZB5O+UTZ+nW21KuhBmvS2zQ7wbYS00xHhK-dshAOi5djw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: imx Add FRDM-IMX91 board
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Justin Jiang <justin.jiang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_230818_873833_B00028D4 
X-CRM114-Status: UNSURE (   6.50  )
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

Hi Joseph,

Thanks for your patch.

<snip>

>                - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
> +              - fsl,frdm-imx91            # FRDM i.MX91 Development Board
>            - const: fsl,imx91

Community pattern of creating compatibles is fsl,imx91-frdm.

Even we have some internal expectations we need to adhere to community
practices.

Daniel.

