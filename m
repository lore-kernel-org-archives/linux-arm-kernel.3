Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552F6FA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOKW02zFEcJa6YcyzFzBvqiMDmz8XBC84K/tcR6sPXA=; b=tOqD77LvmGyRTU1W3mX6LiQ7Pe
	s5W/7G86U2m6cJG9vxv73lCYTLW+w3O0zckuFoaTj0hHbEmp4fdwPjfE8tiaH6Gnfow4C0qrocZMp
	iTB6MyxQFc9WBhI7O2A1DnZCD7W2PMxOQP+LjeBPx7T8m3iZINH0XwCH3Qf0G8+MKSxmNPeWrDXYp
	JLO5NxnfJu0YlKAwIePM0NW4gdV7yWABBAXcZMIYB/ymLWo1ax5hdp3vC3FfGOz/n9HVbGzIRUnv/
	Rqtjez/rpQCEnrbKbbVfKSJhDiadXo0onO9EAi4UpQjmeG9iUZEBIKcWSkyVvqTlOJyWoefL/cw62
	oKuYpBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgVi-00000008O5L-3Rd5;
	Fri, 02 Jan 2026 14:52:14 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgVg-00000008O4t-1n6y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:52:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-37b495ce059so92239241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 06:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767365530; x=1767970330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOKW02zFEcJa6YcyzFzBvqiMDmz8XBC84K/tcR6sPXA=;
        b=UDlraUgFE/Y7GbxK4RgeQZ/xdqesSrUnjhEN3cw0vZwoYOWdzA0AElsY+9GvJhcPRT
         bPM0jHzZdg2e6B8DWH2RQf+zjtLls7nnsnBrTP/+Laux/BaRO3PftyOLxo2R8xYxA7fq
         Y6i3dO9cTsqIcAtAX83QaEpg+eP/L+933mc0q1ZA0sIwkOUhZ23pVbATrLSE7BO+kFnW
         +MT3X/Dut9e+VsSbeUy8JutblLG6wXRzbi3rj9K6whxph/iDGwHp7vIsPmNVVILfvOgj
         zmY30hR1Q55uoUx1M7hvRZsqzoFphA4rReQaiyWCuZBZvnAXzwl7+UCr3NVewszH41Og
         gaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767365530; x=1767970330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOKW02zFEcJa6YcyzFzBvqiMDmz8XBC84K/tcR6sPXA=;
        b=hnGtYZH+grlV6KcT7zSjpNx8IDL9fKdYOM4qbrlkJUiJvjqE9dsolOMlt3C8WPRIVC
         yEdCybSam6+Y+PALEJVVxkSHV44xfV+r2WL5WARsFDiK0Ps1346D5uYm3TJ2yxHkGOBK
         cYfje/wPXnGnncqgvt6mIyLy8kakkWQVmg2mKlcriPV7TGj8qCnEMLuYZKMDgk63TkH5
         cvoF/OWML74T+gZXsPAhOJFmpdGiy/3XxH7wsjqIYjjrG7OXkUJ6NkavPIzVxi7rvCpX
         RXMP9cmZyM9GMdymD3/2Pglkaed5gL08f9tA/yW8plOu8l5X4MHHa3w93Dcl7cnbFuic
         kk4A==
X-Forwarded-Encrypted: i=1; AJvYcCVHKNZxIwopQoubcKuL4T6/zh9uG76GLJNhMVToXGK6go9S9dWt17v45NKBZcwNi45uxxp8AezQfCC3TgtLkdhR@lists.infradead.org
X-Gm-Message-State: AOJu0YxoZ1iHW5nlLkV/YTtwfDdHbwK4WHXj5IjWv7tKJc2MCFQTUcGk
	Ia8SMiw2XQ7xhyQP7Bt/9hH11uZXy8jXeHBrqQIqRCce0QTe5ndG/gVdj0zRlf7WQCeHzFXQqKZ
	LSvL5qlqdUF0py8jUb8nJxt3f0iVX/CQ=
X-Gm-Gg: AY/fxX5KXaqoIFd7mA/cGMi2/9/SyhMRRSmrALGd0tkYPmQ0O1m/QKuFd8h9IPxqK4k
	9KywladUchNHppzkeKykBeCJ7MgQE8T9lBWHpd8fx/MNE0qz+CTtWzvKNqmpBTtxnup04m+Khe7
	Td583aebZ9cLe6BRgesTjBwA1jxSlxGf4cB1pGB5gv6wrdgdmYt6qFvvZGDwQrunxzARZYLqPUo
	gQUedqTHNtEjBJYrh9jHVVF/smEeTxJ7ruF8NA57o8C9KDbiMJ9S+Qa2GXXOR9vBhi+tdpHnGFp
	WE8Srt59gglbB7Fr0XPnftDSFg==
X-Google-Smtp-Source: AGHT+IFGSP0WIXeW56/d36iNW4wftOiWFYzfmmnbj37r9h7tjPe2UQ0ZehS5BUGbIDZFkEsfEteFUqU5FJ239xAHiGo=
X-Received: by 2002:a2e:a915:0:b0:338:10c9:5871 with SMTP id
 38308e7fff4ca-3812161d8ffmr110163551fa.34.1767365529452; Fri, 02 Jan 2026
 06:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20260101-armv45defconfig-v2-1-3a57f69624e0@solid-run.com>
In-Reply-To: <20260101-armv45defconfig-v2-1-3a57f69624e0@solid-run.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 2 Jan 2026 11:51:58 -0300
X-Gm-Features: AQt7F2rTWtpnDxwUx1NNgMEHsWNfQ04mtquh3qojbl8Oooiz5nLz1ccv6oEyu1E
Message-ID: <CAOMZO5B1MM3FxutDRP4_pWJQYRdGO8kE9hqe4vuSxygEgRW2aA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
To: Josua Mayer <josua@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_065212_471054_9EE16329 
X-CRM114-Status: UNSURE (   7.91  )
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

On Thu, Jan 1, 2026 at 11:43=E2=80=AFAM Josua Mayer <josua@solid-run.com> w=
rote:
>
> The i.MX ARM v4/v6 defconfig has gone out of sync with some dead options,

Typo: it is " i.MX ARM v4/v5".

With that fixed:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

