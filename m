Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02D9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqtk7IJNV0Jlogzo2grgXmBklKukxwQuYjeZqgeesfY=; b=iDclG28PBu6fxMbJGB55KINrk5
	59k7CYgFL8S0gzzoDsjYgMoL6sijx57x8JraDG0GQHZQgHzK6aaAD/fuLORSEnO65k3yZ0uZItuKV
	Yk7+xyZsRteAh+8imbrJLpYlJVUKTE3pN6IZOSYytwzNoXMJQoamTh4jwtktACcXe/7h7YdHcu1uy
	U3DueIbZWBLLjXltY+g80fC9FayO2B5KVhijZxZ8q7Oxi5TA/2cT5BFN8eYBeIp0WEJsfdJyAEZTh
	2rJPBYwIOlHUHRLD3x+2qIrDl2wpsGH8rQjHW5s4qO01227hPP/b8HObvVXDQAlsTaroIOIF9EqAp
	3bS7neXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7k1-0000000EjHD-2zAR;
	Fri, 14 Mar 2025 16:18:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7hP-0000000EiQt-1uoj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:15:52 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5498c742661so2508902e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741968949; x=1742573749; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqtk7IJNV0Jlogzo2grgXmBklKukxwQuYjeZqgeesfY=;
        b=a50/V2ctqINRnSvoljbEsJyK7zfn+vRZunL5vY3BITmSKUkZ8j46MUfwdTe/oACkqB
         n8rYfdldWpGteNqxbGEOgbpv+BTpjnZEFXaKA+LvFS5Fhx6krhE8qpvcYc6LpLokTk4o
         YAw0Y/UvhE8xor4IwlvqHdX4B1nKL3YlNYVRBTWPcj7XK/8V+36c0nIbvKMDq2hnybYG
         5mpxtSMbcRaPe9csKe8O1FlNQrP9r05NS8ZXOKnYXkz1Zv05b9WYABDkLTmIz74cQiko
         IweQJ3AhvgGGd4RprZ3VHfhDgN0g04uLH6FhdTE/dQQLUMHRBNdSfFoeoRgQLA0WbnlM
         V1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741968949; x=1742573749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqtk7IJNV0Jlogzo2grgXmBklKukxwQuYjeZqgeesfY=;
        b=w1Zbv6pyuV1mKnoNgUkPrbNnxmq91gcEUlTRuIXcvspQ8YM2EPrs4RNx1WjxlL1McB
         xx0a8CsWkA0M4H7W+d6TcLuqgp3HMsvhoV1PKaBSsV3wkqphPTFABqvdVICZUrM+GcWK
         6BMuD0EWkiFIjZFrIAtCeZZWhx4M/q/OhqtnbbDEw1lYlRmCBkN1UbraQc66xu0aO9cs
         Yf9SmugN8lD05yX+RKacD5wPW2RpqtipyPN2OGir8oM+HhU+YOSFI1EtXvh/HNrfqh1o
         5iSbhaFzovmmBlttXtGHmz/drg7kk2B6FFAVzs58I/pZ5GfOwMlrXqXWjG5BxGrr8T9n
         KvAw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ3P8iz63IaRPWYUIwgPRMM17aPOI6hPteDbaiwvl83yiCmUd6+G/Jmyx2gY7Xq1/oR50RmOK0avy+XmdfMme3@lists.infradead.org
X-Gm-Message-State: AOJu0YxKMZjOSfwGZ5Cy4jsANBow/4n+yByiRCTRKPucjypxYlxIIg9s
	Xdbwt2aqV+Q9EJPaxfbcVRjfL8u4nho6dRUjim+6VChdh8GFBeQvu82YbRipKgdwyckaVUWmkgY
	NOmGC6AkOE2WCofcFJ3MabzSGpU8=
X-Gm-Gg: ASbGncsOP2sy5iQpVX6n+TF96hkKoHYSqWkC35/d3jNErg7k9VLdUFjuRNtquMtzne+
	ttjYAOi0G4xrqLwXEy6ivuSSkKzW+YoZaQrNH0KiKH06MpewzcrRZjiotbdI1FtUdN0WqhwJGQW
	55myNWtruZlhoP3OJoq0uD1We6wd6Fw6XAIOUdTydC1eFfn+qGNkWP4OySpA==
X-Google-Smtp-Source: AGHT+IHs4vHG3o/VoTCk8BvZAkaA4ZWrJ6VUBnc+4V5f4RD13xhlVAn9aENqaNp9snNvosmgj0yTWM/vq8qkdSSAfs8=
X-Received: by 2002:a05:6512:12c2:b0:549:9078:dd46 with SMTP id
 2adb3069b0e04-549c398613emr1113102e87.43.1741968949238; Fri, 14 Mar 2025
 09:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250306222359.797855-1-Frank.Li@nxp.com> <CAOMZO5CL-qQSHuSoCtb+f_mqNG8vu4tTVDi-ThoHq+m9SeagxA@mail.gmail.com>
 <Z8oqhGmVOBCPlJUI@lizhi-Precision-Tower-5810>
In-Reply-To: <Z8oqhGmVOBCPlJUI@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Mar 2025 13:15:37 -0300
X-Gm-Features: AQ5f1JpU2myyIHkRjTA1o08t3hT9TDTNqBiNNH7ei9kP-eOpdOt4OgxaTqhZts4
Message-ID: <CAOMZO5A9ggneYjfR=R4kY7DY-BC2pMh+ayiPEtOTOipCdtBWvg@mail.gmail.com>
Subject: Re: [PATCH] ARM64: dts: imx8mp-evk: add ecspi2 support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_091551_492079_AFD7FFBA 
X-CRM114-Status: UNSURE (   8.21  )
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

On Thu, Mar 6, 2025 at 8:06=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> Thanks! It is actually to get spidev. From commit message, I don't know
> what next steps should be did, use "rohm,bh2228fv" or other method to
> support spidev?

You can add a specific spidev entry. Take a look at:

https://web.git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/=
?id=3D10254a6c6073b0be171d434a3aeeff0256e59443
or
https://web.git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/=
?id=3D9783da2384c5623d376e4641bbce9339be1001eb

