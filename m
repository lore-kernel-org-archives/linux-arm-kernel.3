Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68571E83045
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 06:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=; b=BQHUKdnizjzJzQO+8cmVjVbIIT
	KRmqmo2eZXJ/a6tzIxGWLzDeWw5k7aiqtIKA8sUmWsEGJd5T0Kq23j0woJQQFJ7V1HXcQV/JDGdle
	/XInpnkwbCwQayM50st6Ta+SUp8EkthEBZWfZn5EL2oZCX+zIOcUIVYpVMFf5xM0xtCXgJmY/7ZIx
	rzFnXMHzjm5jAzUo3oX7cio5B74cZuYbIWy59yfpVTENapStt+9re5EP1i3dH9u3riosTNXItwI2w
	ichU2TdHKZSZslO3mFaVxJAYKXCzF8F5HvRrZjPvnEKb+ZfvnPVxbEOD2bRqTerQse6I/ayJne/ll
	EMDV1aWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWeN-000000081Ig-3BeZ;
	Wed, 04 Feb 2026 06:46:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWeI-000000081IM-1Azc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 06:46:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so51500885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 22:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770187560; x=1770792360; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=;
        b=TutVUCHFA6wPeP5p+z6hUXp1HrBy+2qzUr0D2jdaM6YYRXII2UOlPc4NE+Ig5Q+hL5
         zjni1N1Ug6HORs2MS3O4zvk9zdMmm8OkiU8K0FgSUNO0jDrccmCFw1RR5yr/lSxoLrsj
         9C29hiiRa62Uy6wlkrAWWmXXZfFw5a8Xy6PeuywWT9z3PkxqpYehzfwSd9UI/UnQ+xuG
         Th27gINh8LPZN0PnM3oiTWS3kQYwtytg0WcKDuWIWMnO2AYBvROA0M+vpQ1ORKZlEna9
         DDFAonLxsmle5SvGAW/bgW2cCnJ9Kf+eskbijv13OO37LWSuLczS6BSG1CXzQd9EVNOF
         FaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770187560; x=1770792360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=;
        b=mVQj9wy6QL/C1jKZSZQEsU1A/c5XZ4HI+f8eZVqGUXEtYA0L4s41eBh42Eu03qp0Fs
         q6C1fR2zG9UEyY+VErorFsSsFsvJ0l/H+H7SVrFWeM3l0miwj2giU1YAhcKqMCLuPYGS
         niELo0Sx2cLMurEJdVWFrEYLRacnCx6Ui30cftvDk7u71nTIAP9lThMQqhUOrHxb7d/2
         15MQN0GrL9yiN9pvKk08n6SstWxrb18ocw2+b3MUEqLQBVtBfDXWlrnbF09EA/BghJXx
         EgZk/3iysjYoPnYtaDcLl1fmUPoO12ObDpQCed5C9jyD4ijA+4lt8zUd7fNpSekXnJsV
         TlrA==
X-Forwarded-Encrypted: i=1; AJvYcCWuebNo+V+eRcalpiZS6QxdY0pZjzMFvH/yCdEffjvmWYXWpwz3njR6vQS4paWCuyxv3ZAqq9nNsv54Ix3w1U3T@lists.infradead.org
X-Gm-Message-State: AOJu0YzQF5j5JmvwQvJBqeflE5fbFFETKfyt9EzF7BcdG+N03hz5qhEW
	nGdvSveI1H//ww2hJdqDidA9QLkQaEX2kYRUJcXcTFYi324T9XqhUbChj9qEI7REdgU=
X-Gm-Gg: AZuq6aK4Jd7lOufJQkTXnZbfxJDKpC92VZhx5SL/MIk2vvWRrKDxRufLtQmzWBShT2/
	QQapEWpBODh+zv6H1WXKTE92xycDaCL5eCoWXfihNGGB+2PNzwnqVgJZBLZrN0gNDcXdTT0ug4y
	wD/D/XuTc6UVAkjP1vNGqqvNvVSTknr+sxMrho8SImDWv7IHA55seMjWL+T8JOQFzeZi8lbX327
	oNfYIDVFX17vkNm0AHsxUxOIeua3rw8+XDiANl6J5ewMpfun5w9M/ohHT/va9qbKie/R6j5YWg7
	Ii5rRYADlJv6HtRIs2/8hCuBO/OHVwktC2HpdNUv5ERHXP94e3NkO9LShovkbwal9Xj9RX9RnCl
	Pmo8cJA4lKYupo7X3cC7cZxQ+aVW/SbazJA0X59BM1xxT7EMzQUGiJiUFFF/Z4gG30dteu0M55i
	O6RY2h1zgu74IHm3WO2g==
X-Received: by 2002:a05:600c:4fc4:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-4830e95d692mr25283575e9.16.1770187559933;
        Tue, 03 Feb 2026 22:45:59 -0800 (PST)
Received: from draszik.lan ([212.129.76.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831088d318sm36527855e9.10.2026.02.03.22.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 22:45:59 -0800 (PST)
Message-ID: <977c081395c664a110389255e0cfa7eaafac912a.camel@linaro.org>
Subject: Re: [PATCH v5 3/5] mfd: max77759: add register bitmasks and modify
 irq configs for charger
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Wed, 04 Feb 2026 06:46:16 +0000
In-Reply-To: <20260203-max77759-charger-v5-3-b50395376a5f@google.com>
References: <20260203-max77759-charger-v5-0-b50395376a5f@google.com>
	 <20260203-max77759-charger-v5-3-b50395376a5f@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_224602_368352_05CB7D30 
X-CRM114-Status: UNSURE (   9.36  )
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

On Tue, 2026-02-03 at 22:50 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add register bitmasks for charger function.
> In addition split the charger IRQs further such that each bit represents
> an IRQ downstream of charger regmap irq chip. In addition populate the
> ack_base to offload irq ack to the regmap irq chip framework.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
91 +++++++++++++++++--
> =C2=A0include/linux/mfd/max77759.h | 204 ++++++++++++++++++++++++++++++++=
+++++------
> =C2=A02 files changed, 258 insertions(+), 37 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

