Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF03C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=; b=msXapwnn5KDyaEeOJd67aaE1oe
	dypyV3geDNKQG9jmoXgOkMm/KBaMwumBtUkSXiymXaRz6zPQWmJPgSrFRT8bfSzLJ3652UFrb1p6J
	KIpYzm2wGYSX8bF5K46Zr926tQIzumaJJXRUus/PSLf6lQzOB8Mdfvz075NPrdLunq8crQRISyylk
	0T5IexhkYgu47PvCt/gA/tKY+F9XcPKiMNGqWODf7/clruOY8KPo5yQeC/VTVJUz7HHwU8NuaoRTy
	PZ+h+d5oUcK6yvP15FHr+6Cl1OG1yhr5ZI0lOb3GcSEa8a6yAC6Ndv0YF7hYfhoTeEZ9tnK3N7QRi
	ZT3TFnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBcc-0000000FmTQ-2k5L;
	Tue, 07 Jul 2026 19:38:22 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBca-0000000FmSH-1v3J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:38:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-381216921aaso4219838a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453100; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+AZq9QERGVV7FYAtODNhfBNYzZEqPqf+JH38lAGy9SwRdIA23t6nUYUheYi3miAoa
         Ao8uCOg/9YtR7OI7q1JYiskqexCVIU3geDhphNE2wJpFGp4XFqFE+zU1FhRzP2mSGqHE
         +oRUjkZFBCTb9SHTiuOOAH16sLGOMtIFU1O2zyd31l7YreObhoXIXvR+HiMdHOTyII6u
         WehBaNnKV0IF10YlndroeGg/DeB72Ycn0EWFhtxEe4y2dP1o41PIsqkRFEF2erXqKZa8
         Kh5cTE4NNhLF+TrT/d02OHEhopyu0u+I2D9ZRw/zMH4FFB2QZIWbpbSsCYzG6lXiZAWR
         LlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        fh=NhgOqJs+ngpuNSSJYZA4o/9uX91EEUsJeh+rSYofOBs=;
        b=r7/NUKxoQXJXU1oAXLLQoi+AIKb9lsFqvN/pfAIPeIu1lIwaUMDs3nTP5QlSFILD1a
         vBhGNzjReyxMvmcjecvsDVWIeOnef2z3WhPFwWaWtevRvPcrby2aE75LnMB0BLNjTnys
         d7sJLphxQL7LOlX9A9c5EnK8BW2CxfBOW6loP8N8XI2WDqF16Xf7g10me9nA6FiPKKcu
         YnmqTzcfPDdNB2clL3A9WE6YyDmog3sKVzLUwb7got/Z0hYsPNYHb0WrxLULJr6aLUyb
         aG0DxGUJRJBCus6z471GEWpCvFuDRCeH7mLFsBevZQadXbUVtI2QXMURGHLZiuYj2nZb
         /mUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453100; x=1784057900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        b=G7y1GOkOF54C9xRyheRODTsr+wb8PE3Ux1Vk9k45e2Q8O+ukvvuLbIGoYpMtlDT5Pb
         utXPiafovbYFsNnqNoRD/+AGLkydIlHQ8lgPEURYhZZQbu0yYuedRlZOiZZb7612PWhG
         rcocqTq31fAXpx/fNSP5Ve8X3D3/rwfQI34pN2jR8TN+EwJFz3byzLkwDdRSYlhfpP/M
         IjuaO04I6xBitW4soR4V6+7BeAtBi4zA+mvPe6eQcxVuWmTyGse+25Jl7fCQa5Q5EJRx
         aVP2vd/LaQSfiMf8s4z4BdmmP1uOxQzYOGAm4k9uP3tP9a7ABH1mE+wLYTkt2wrtDZXK
         j0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453100; x=1784057900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        b=M2O1FpLNZOSXKVda1HuoruKA9Ni3c8CzH2kZdY2Okq0br/QUot8qDx+B8dSkJpgYoF
         dwj7KzQpO0zjsgwlaJHyb3H5j03oUgHeYEsgPrlXhcTARlx6YMbAPPjvwdj2Lks8amIN
         1Iy+JGlrZv7qDqOXo3YubkFjP7uXJXkJVDTs5l4UOYYB5xBFiZomOSQgtlvfI5Z32vi6
         cUGmnoPX7YMaPB3913/wsUEByRlm4S/JIGURqfOp8W/4Saq9mKO/wRannKUjdKl4FbND
         gUxcBvIjOahfzxwOaG3Ej2SWB9yFcuSZQdBDYO83/OT/H0QQTN6fEI3fzY5nwW8mO8BH
         C6gA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Z6MDR3SFDMtX0OOLq0GT7cIKMOqL54L0PRMqNUufBLRLuzD0bwVI+/en8bhIWYbLAsOHW08ScNyKBAAtb1oP@lists.infradead.org
X-Gm-Message-State: AOJu0YzRfI5Ipx4uOevA5NJnf7Bm22mUFrB9BFCXMjZH86enxIPuOpcE
	FthH9nbBqopvfDs7w1IJsDC0MwLjh3NGUZuTf+M6E1vJ0vUsC9YR70wDu2tRBEUYIJbeOF6gTOA
	Pvtuhyf1//9Cx3qFLpPNegkNerwS7h4I=
X-Gm-Gg: AfdE7cmvY/YqmfCD2nnnhDE0j6zAOrLn64S+VvoN38Wk+p2fIPkI8u7x67wzMjqI4ab
	Xd4El74FKVzZDsso+G0wamt16V7I+MthxlJw+MgJJtAhgaWcQsYxO2m0jFJJApQP3p06fjIzH8c
	OFslX42psEnxtpFNTnaPdQOb4QAJjKoX1aLvEDDgSE1jaqR1XEBRTJtZYUmB/LbGdHMEUKkEzsE
	Psf2uXGAuGCRk2BGlk4EIwq7gTr8rZ7qLupUDcAiyBl4PloWYeKgHJpKFRaAUOuvDP6UFbXlM99
	hbOtEsZkBmcJkXProjPcK5QAVkDuqeq3YW5t
X-Received: by 2002:a17:90b:2dcb:b0:383:5a16:bd70 with SMTP id
 98e67ed59e1d1-387582624f0mr6371414a91.16.1783453099684; Tue, 07 Jul 2026
 12:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-4-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-4-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:38:08 +0200
X-Gm-Features: AVVi8CegJ64Z2gd1io1fmLKunzl-GtPXQOMtd5GAEdMnAz5kN92Sdzb9oNcj0BA
Message-ID: <CAFBinCCB1dRkqq3DsFn4nL0RZ9-pRud5rDUxTz_2NokGaynLxQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy
 node by default
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123820_517895_124D141B 
X-CRM114-Status: GOOD (  13.87  )
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

On Wed, Jun 24, 2026 at 3:57=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> Set the pcie_phy node to "disabled" as it is not used on some boards
> and should be enabled per-board when necessary.
>
> This change suppresses the deferred probe warning:
>
> platform ff644000.phy: deferred probe pending: (reason unknown)
>
> The meson-axg dtsi now disables pcie_phy by default, so enable it
> for the s400 board to support PCIe functionality.
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

