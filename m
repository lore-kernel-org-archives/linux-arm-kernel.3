Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028FDD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=; b=M658Rl74zAYxeLotiCybHoaedp
	bRxbuV43WkHuxjTb3oVkklMlBCRmoyo18GjQFHQ9aUFOoHdssTbR/VNVZfKLxQtY3AtCgOm9iBlR4
	8QiPqgTlOqgGd0M0kRViKrNIjtUSsPG69CqQOSiai5qhTglaJT5qr+qTHSSzD8WM1vlrdQ8xpnmKf
	UE/6aq+0daxdyi/tDbcK377KtAiGE6peBR4ApIF2iANHcvRjI0FS52P/hDC3FXQgeJXbDYSLgFgNw
	B1q2vMjzX65eMsipoI1UZB8BlPH3+eDQgkWhqFjgs9J0afjOVzqgwcIN4ghk7VJNc7J+bETrFurL8
	hvSCJeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyMt-0000000EN6G-0MKV;
	Tue, 09 Dec 2025 14:07:07 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyMq-0000000EN5m-2QqH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 14:07:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7ba55660769so4854718b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 06:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289224; x=1765894024; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=;
        b=YNMhYB4kCr302m/xrb2DPgPIRo7w8wNeGQny0K+dYsaAARLgjVPl+xGeGCaljsR2mN
         /oNdpgQNHmsCg3wwKm1mQBaUPOkKlLqJtxTTUtRo+vXpVPKCx7jiLK0v6e989r3wMNmS
         n3H30IG6aRKt+DpVfk9DBZUzCn0oJPcfEiUnaMPLG4Nfg0LTl/ckb0LNyB6p0Fifm6du
         clR2lDkF5J7N7j7I35e+qc4Sys5a11dXbw3JkHPDsprIlPmRtZjP/nT40d9K5ZCTb633
         ArfOzxCc19wFvCXaqjSRuL2c9lI5tPCjC7D4b2Ymfa7Sgg1IKp5HizDHi4MJWli6jfJd
         cAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289224; x=1765894024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=;
        b=w9ozbhQ7WFaFxJ6vk5iiETkXjpNNvfxooZtG67k75ufiXHskq9IWrob6Z8h40ltEwV
         63NZtsibszSvD6Df3nAfYedM77Wl1HG5N30EpQmlxWyCxgNR88Cru1ZViT4K0D2pUD1P
         xoyHb/8+OGQhUZZn38yMu8niBBpT5Qi/SCVUQIqq9Ycr6OqXXNQegH4ca2KEhWfDGu9F
         iiSUUkbbBiVPBEEwpFG2Vz8K7oM7EuAJCHMDMP4h1MrDR8Lr/PdxVAIb3+QwedI3Rirb
         vXVZqJog8yiLop2/BpbqNPjuuf7a9knQcUDjG5NwndVF249v6iGYilWLBd+cQfftVXO+
         vDmw==
X-Forwarded-Encrypted: i=1; AJvYcCUMURK7PkefrrIip+Kan+ELm/aaOdMXSCxi1owwzZ/WpPnMG/iPrLaOhcQ+dveTYfLAzPx2h5kHTiFoR5xjbyXv@lists.infradead.org
X-Gm-Message-State: AOJu0YxhIkn754ih/Cvn+RwQ1tdAJDhwK5IfDYuRDEXHv5vq9q6eOSmD
	winlcTz1rW1MLLtwdr+FsiwHTF+fXb9MEiTEOXEH4a5XuM2kfXbmgCvteBAx1EX/0wq2UqOz6Jx
	yQoJ7P6PWGbTlWxNPX/4FEO3C27cfDJG/eQ==
X-Gm-Gg: ASbGncvNucW9zEuZxrIVt4MNNusysfaeqTNHI3aiCKuSRcV/siXB1akTJpjwArvUmIZ
	WMnVJj9M31RFxuMvkptVPQ3S7oB/zxCPi76W4BqLYQYAFaMCIBo81IL00FlQ23dMWDcyQwApJjD
	GFkvCLI0kPqWWfQ1OszbxLG0SvDuPpOC3oodaY34ffja0wEHiDJO3/749F6Rfz9CidSTxgCCjcn
	SMROF3ZonynRESA3lL4Zk+BBN7NbmZ4Sxuw3OLhHABrvecsrvOopAt+bMSyt7vSZ2g22ewj1eCr
	ZbDmb+TxIWnHApnpBxs/qp+4YEtPAPdPkCvHdktlj6wPxsz0m7l5m0u+j/8e8aOdOJigOBJpUAQ
	NmcSeU3AHMw==
X-Google-Smtp-Source: AGHT+IF5qKkipCzYEFzejnBb5df6vSYSFDP3s5q/B01Pgp/zxcwgrfIpRlHh7JiFs/tuo4o8rJk2zzjfEIRdHLWLt+o=
X-Received: by 2002:a05:7022:4388:b0:11d:fc64:9562 with SMTP id
 a92af1059eb24-11e0315ee8bmr7976330c88.1.1765289223387; Tue, 09 Dec 2025
 06:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:09:30 +0200
X-Gm-Features: AQt7F2oWIRtUxYk-A63rfaiqGIFxA7_EkG0XNavFrSy6-Iw6Vp4fAIgO0gAu08g
Message-ID: <CAEnQRZCPX-enWtWYXM1KD95=bTD5-i46L2Bej7gXP+mggCUwPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_060704_621224_F5851B91 
X-CRM114-Status: UNSURE (   9.12  )
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

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Firmwares that do not use mailbox communication (e.g., the hello_world
> sample) leave priv->tx_ch as NULL. The current suspend logic
> unconditionally sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
> an initialized TX channel.
>
> Detect the no_mailboxes case early and skip sending the suspend
> message. Instead, proceed directly to the runtime PM suspend path,
> which is the correct behavior for firmwares that cannot respond to
> mailbox requests.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

