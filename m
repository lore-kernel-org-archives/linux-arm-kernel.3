Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AF8FED3D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kaxdmfqBq8C2utWlphEm5LcRzpCJfnzuzdOC3D6RHM=; b=sRsRYzYJ84Qc6d4R/7PFL74SMc
	Pg2OQKqeYwDntuyB/drhI+FbDKQXY8V+E0eD4ChbzdcEzByJVId6jQQtc3UOPYGmvGsYV3HgjxNof
	nLgjCyBK+smg5vM9O84nZdA2QJd37uvPdfgNfOF5doUTp6rR9beblfWAgkhrBBKgG6MngyJlZg4Xh
	oAG/PnzxMwq8wyMpiPqtV15qdt4eDsy3L898iqwTnNzKxrLTneIqKwt3e8kD2n1DKYIPOvcWgngEv
	Anv6kqMofF9XMXaGJtWA+Dm4o+vbuk7dI8GfkmB+VaDGMoAo/wFr98UR7PIxtQD+ARE/Qzj5ZtuOv
	aRwW0jGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJCh-0000000DRTf-3tms;
	Fri, 24 Apr 2026 16:16:31 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJCf-0000000DRTL-2wO6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:16:31 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-12c565476d7so4091199c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777047389; cv=none;
        d=google.com; s=arc-20240605;
        b=A6Xind/R3yJAhr0lQ7nwgWtDp8y69e2P8piVHXpa0VhAkMaRSBpqd31xdIypnhh9El
         GPdNHVmPLPvOTz9wDVDEtKE0aBsMGrjSuK4JABdm7R3x158hkhW9UKYSHZD7uxsOkNtD
         7p13TXk1PhleB40lprCnCgsBqTSGs9XCp8KNg6b57UwnYxAJxJECDLddwr1xY/tYsHzR
         DYsPprzYOCTMNHDzZzByLh2bprChymlVpcqZfCnlFHymoWTvHNPISc8GqeTCPBDEeRxY
         D8oYYCSCP2c9F75PZPpKojPBM27HhW/ba6+Zzual2POnb8NuNY8fZV3ldwYwtETbkK2X
         t8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kaxdmfqBq8C2utWlphEm5LcRzpCJfnzuzdOC3D6RHM=;
        fh=B899J2DyBB8zbnzgz9282uUX40BWzcjMog1+E3/Qs6o=;
        b=K4TT7/7wBhhqlARFhm4NGF7Em2gnS/nteiZYvW7J2Nhm1Tz7S8Bh9IOi+EzIS9FFRH
         r3lQeCwia6i0P2HbzLUEpcllKPWNGY8tcKaR6CTiiuXckLqtm/UCqUw7bs72C0hx0WY6
         kDeGKgH2AmG+8mpH5x/1QkjeM+cliQIULPK8tmKEhVusMPjNSg8nBwTRXi/BZ3+9CP/a
         KU8zOo8S/KBXG4md3e/5YSk0LG2Iq6NzNimposYXPI7OkcxRp0sWkJzm4TUGy7Pw99+O
         ikla2OIcTPH/DUPghcvc72O4966NEE1kEwe5ADGeMlXpfv7vOBJxQVD26zc4TBaupsOV
         cYqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777047389; x=1777652189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kaxdmfqBq8C2utWlphEm5LcRzpCJfnzuzdOC3D6RHM=;
        b=i+QOHP3+lz5h9tmZ2BVvkcS5ur47Mby6KKAbYo8qLJr+Iwghd9NDZHcdCoUM1Kzef0
         rCo8NrQzpJzjmi4bDYALHhT6uiqwP5Cr6MktfR+l2qOtJCEF57NJ9rC65nYuBc/iqhLr
         gxMDYwnPh75g6m6toqEIQlXV+/ND0A5iuqcVJwaeF5e+miCWEd4s9bcIzW0X3zw6ugPI
         YZop2nOiIDK2sE3GQEOx1BLr1JYvkwYFsFDvN3Zjzw+9joeNZFABpqialv3v5Ctz7zdS
         ca/vnKIEs0kPPV6zvl2PTSGjNYmxFAVmXgTQELp+2S5u4+HfCCoc0xJNAMQ155ZTGden
         eUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047389; x=1777652189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kaxdmfqBq8C2utWlphEm5LcRzpCJfnzuzdOC3D6RHM=;
        b=B8gtHxtUt3uTUD/ug9Xs3szdl4ew7edcVF8o56EjNs2Bv7X/dpaVum7AiPqbLo89G7
         PJ6I8hMfsyy7dWyTO0KdpigpnI7r2ZDn/+mnAvKASfaDW9NtXmmkNp37+cTbEQmxCe8t
         t4xIkEJD3Vts8F8V+wjFMRFUa7Iy6PPv/rL9ByiUA0oQnF6DWvP9eznbJm+hkNFA2Z6h
         1vyGgNP/x/ghPlCKg60dZR5HhR8HbVuY4JiZYJgF+29UMHJtC/jQCuWgltcP3yrmEjYp
         ccKMebN6jAXznZFb/ITeyvAuyn70gQ1xfwxtpFD7FK9E08Vu6oS3VSIy8A2Ud/HIwH2o
         VMhw==
X-Forwarded-Encrypted: i=1; AFNElJ9gTgOIc1lMkl8DwmRkqlsMvNzBRVFmrP7r5CDLqo30IhrGS+eiGahZq9gy04RiigUVFIzSaRyEQfYU16W805GL@lists.infradead.org
X-Gm-Message-State: AOJu0YyEHEpB3peBEa5h83d5/NSFMVhFbM9frYnUiUr0R3dhUkXAp3NO
	dG3LKdcgsbyhQdV6wqF7hGPlgRUhJBUIf0AaokeI4EwqvuEul8cOjtNrNTNYC0W0G/WCR5NrVvM
	M85DfNIVu7cCGNAmukJR20OGs39O3LzE=
X-Gm-Gg: AeBDievxRrR2NdfTqQedzXjtottuMVV7W2s4x/Lb2kjVhXPcQv1vczdvWDm8njvXv46
	QBj8YWlyt+Nqv01Cjvy4JMOb2glz8N5jKidL/HzNLQbq7d5SALL/XiDEhcW0xH5PZODo1/6wtpn
	ZbBvvDzp65tAFV0VIcRx3gWp6NwbefmxbkAgPzCo+B1oVaUt8e+EE2WB37L0T7cAAS8CfBdlYO5
	ZnuPixe5BwwFH4L6J+WqMqWmRc6ayBJyYZrLc5xLX5I2OyMhSVNeasQNJ/IQ55KAbQQCh4n/52N
	eYMU8KBJWMYyVbENPrf9rcyPmCqsVhL8qY14qeOyjTxlkCbxBxNwMvCiOS/GSxZUEWA7Gh9Oz1B
	DG4VQSx/B6uT8J8rmA/+Wj0a/ESLdt8oDye/vvQ==
X-Received: by 2002:a05:7022:f016:b0:128:d4be:7438 with SMTP id
 a92af1059eb24-12c73fad42amr16965861c88.30.1777047388527; Fri, 24 Apr 2026
 09:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com> <20260420-beagley-ai-display-v1-15-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-15-f628543dfd14@ideasonboard.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 24 Apr 2026 11:16:01 -0500
X-Gm-Features: AQROBzA6ToQMdPNxQfm-1s1rL8nfgq-Z1E4rbqFRJtKj9KT9hbDXQ7tUBkUOYMM
Message-ID: <CAOCHtYjJgqomKreDxLUiVbUtpeh36f0bL-jA6P-6rsoJrweshQ@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: dts: ti: beagley-ai: Enable HDMI display and audio
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_091629_741183_261AD0DB 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon, Apr 20, 2026 at 8:04=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Andrew Davis <afd@ti.com>
>
> Enable HDMI support for BeagleY-AI platform. The display controller used =
is
> TIDSS and the HDMI bridge used is IT66122.
>
> Based on DT by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> [tomi.valkeinen: cosmetic fixes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Tested-by: Robert Nelson <robertcnelson@gmail.com>

Thank you for getting the display back end working on j722s family!

After this goes in, I need to submit the usb/usb-hub changes to enable
USB support...

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

