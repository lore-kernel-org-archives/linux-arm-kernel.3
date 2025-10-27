Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB4ACCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=; b=Ntpx+xMlu5foOBSEJmjR2fMRzg
	+FbuF5ZDuHcodLB9NIYODbwb3kUMEm1pCC3JAmTUXtssBxaWztGMgP+A95S/KirGxdMt+LNuskNS9
	is3dddmaEy5898+WBLGjUvjj3u1M3+rSPTG3SRwC9K+vKnfIM+zLYmmI/zLpYSHGZy24HjMAhu38r
	QhJPk+5Mx2LV//tRqpXxdcRpDvluoEHU8X8cwTaCdcNxlA/OtWqpVApki1DMNOUgMBdGL3VKQpL4z
	s21h5r6Zxvr0pgGgwWYjiaPxzflrfQ1ZavQ6j3/rzW26y+lGysXCY9FtkrTHuLPnbGCwFioYUcsJa
	8YO0kMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDK5d-0000000DcQo-3bqI;
	Mon, 27 Oct 2025 10:04:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDK5c-0000000DcQT-1Wc8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 10:04:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-290aaff555eso40948905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761559475; x=1762164275; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=;
        b=VX/YlepMQ9NHfvZxEqBt/NLfEXa99AXbx8ONdTeE5fMa49r3Vb3xdj0CNiz0kFvQWS
         NfrtX7wUJcpqQxWa8QybsDNp4RVX61eMHi5foHLevB1sWoGz4Dm+6pv+jvRCDy8vLji7
         JJqTMiJ+hupJjE/xXD5sysk8Y+diEa/hVNHHRfMDiGY9b78dZSzI31JXNW+e32ZMiFQq
         K0Ez7o4Ncjb50i6+i4IJwo/LLU/j2D3dfPM+ANAN5fIcHEVAH5j6X8bFw9Nk8Ebad5Sn
         xrp8tgY9htAtHTVt/IdwoiVF/OmlDWGVLyf31tmR14WLTEk8n6Irnol5tC8SJJnBTpc2
         wlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559475; x=1762164275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=;
        b=FWxJ6bYdOhX+oHKvog2wpsvTh4yj52mOBy3yroKkQT71OD9Z+f4UY5TeLljUoXg8hU
         NiBK4TQ0yF2bUIJmOP5jN0bsinkALPAd6OAE3YYcpRdmQ3kF0c7dXULH/kmF0/v+U4yK
         nzUNXfBOQpBTUUL/EbUxZqYyIj6TJFHBCkHdyte/U1IFe0qGldM3gnvwrMDe8s0avCAX
         bIWPKHlw9FpIarxExrgzYwY7TbRZGOlbkqkAOR2NW2k+c/GiMUx13Hb6eysS5c9tcICS
         1GNONjVzvKzGLekj1SHn4CwLFW0mcNcbgG1Alg5z+4ACLxoiY6K3YbFnTqxpnnPze4+P
         YkNA==
X-Forwarded-Encrypted: i=1; AJvYcCWw7Wlqg227y2hR0YMOeHie2jo2OCjwSXS3Uptnb3/dyXK5lPHKqIYMy8IHL3c3Cs3P7dIhMOsY3adASWXpmwkb@lists.infradead.org
X-Gm-Message-State: AOJu0YzFcmP2hT0Ct8qdoUQmlQy/j0xJn9SKlWnIYnaCYQQg2KApQNY2
	qX+GMqwW0rs4e1CHYhvmO6eVKb5DBJoIv97jsl0/8KM8pEBP/KC0S0lVqtgAOE2vlkl2BZqweNL
	XMUqZRlzEmuzM2DMie685jN86tobibpk=
X-Gm-Gg: ASbGncviOmC2SALg/bkhe1xWfmVMkFBf06YMHKLSNa/ajnRejOJrKre7SuXZIp27waJ
	L++PBHM3hwv+9J4YU4U7ZAzIUj7Ak7w6ZVFNrWzAxaEeXOK+y2qNc+fQQ+GzP0bVgl0iStaxlkR
	6p7H0z5jdnn5aWms9mCqm+LSD3A/MJNIOIvNRC3nkz5eXhub043FHgE7N3EhKS2/N2Qvs5TGVRa
	LBvCrEz3iFcSFHLOEiWpFb3tE/aNhTnJT9xotmXp7OOvj2gV1fSMyN0v7CobSbrb9REo/7wLwR1
	qcSTKbjhVW/+OQ==
X-Google-Smtp-Source: AGHT+IGw9d1pKeseKB3lkBBW02LMj7kEUpU+h4+fmOwbWm1TH6VnLmuaWiTPpQmTwuE7imUFGIVOUC22U7kWNosjmns=
X-Received: by 2002:a17:902:ec88:b0:293:57e:cd70 with SMTP id
 d9443c01a7336-293057ecfddmr246648875ad.28.1761559475507; Mon, 27 Oct 2025
 03:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 12:07:00 +0200
X-Gm-Features: AWmQ_bkbCiTHPHYYWScVXCVLYPxiC042hgQVGHC_daQ-QvhcSia1ZdA6dYYMWm4
Message-ID: <CAEnQRZAN0Kn=3hnw6dvCDsXXrQc17E87_hRT1R78ueKh+PzKjw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: imx8ulp: add sim lpav node
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_030436_401595_785F5DE7 
X-CRM114-Status: UNSURE (   8.40  )
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

On Fri, Oct 17, 2025 at 2:24=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add DT node for the SIM LPAV module.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

