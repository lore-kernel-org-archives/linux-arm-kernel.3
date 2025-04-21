Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D76C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 05:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Jzy9ZC6JBUJqedz2CiWnh2u85n2GsNVxwhydMt3RGw=; b=tmaiEbz4d8NtjuT6N1wwbZYsQX
	bAtpRJHiUc6T1uUyig8xZwTTenvtovCa9p/w5uywrXNVgE9nX8tATsQxjPVZJ5DDT7CEB/+/ES9Hr
	ljywcoZlNmAbIIF9taQM7PyCK8Ry54Rm8xh6LZN+QOLZSh2GPYQal18+e5vCW9+HgWbrFoStnlKbX
	VhAUvcIy6RfZqfa4zKYewVK8Ns+9jZYdR+94UIWOY6SzUD87a+GYhVISnmoWcupTgBi5F+OMzZBin
	SpStVGQ5kmBSz3ZwSjaTh1aD15fDO5xiIqkqWXac6r9WETO2LqY8ATYOpn/gRIQ7rIefuo2pyoi1M
	8v4hYd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jxu-00000003eK2-0AAw;
	Mon, 21 Apr 2025 05:45:10 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jqM-00000003dlS-0fLg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 05:37:23 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso34364391fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213840; x=1745818640; darn=lists.infradead.org;
        h=in-reply-to:references:user-agent:from:subject:cc:to:message-id
         :date:content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Jzy9ZC6JBUJqedz2CiWnh2u85n2GsNVxwhydMt3RGw=;
        b=fJcBH+g+PRhiXqN49Xp3175z6Rc2WLkmocggg+Ej9kU28qbnsI4ui0kA5g4cGgCgkD
         vaW/OdDqpw/OKshAnyNnle785zqeh+Lk0yiASXoCrH8t4btLTbV6YthRRxNey4lNtoo7
         ACy77jQey24hCbMusXMCVU7ebClSwIhmoHyo0dwNyyIGYY5flH8wvI3vTNWUYBVfRdvS
         JQuV1F4MWjy0ySG+TXH9wC25kg8qw7IkTjpOYqOW74tSFE2KKpCF0WF7TftlGHXaukhL
         oPPwZAB1uczc9nKMlCnCrThsuPrY/OeQYcKaYYVeQm8BOSaiOp1zStZKXxQpDnT0PqBM
         CKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213840; x=1745818640;
        h=in-reply-to:references:user-agent:from:subject:cc:to:message-id
         :date:content-transfer-encoding:mime-version:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Jzy9ZC6JBUJqedz2CiWnh2u85n2GsNVxwhydMt3RGw=;
        b=M2UMjlzFSCu9XQZpdvSg4NjM3L7aYDeWvXB9U3o3PCWaZBqP8F9UNGk2EQ3fptMNVR
         5/6koCbeg5y8LSUTKlz9i46VP0aYsc93TViOPe9kHtDILlXGVN9G0njysviLi94fDq2C
         rhyDXSdC2cG4V8bj7eOpKo4uZiq5wjJQIGNsRVjgXu/rEmgpgdgHb40aHf/evewpNODM
         UbQvr0H5+ZYISHb5Q0jm09pjy4v3U+DXJJoY+o6AlEyAhYQhYoM/yLDCyCwR5s5IlOac
         m/222A2nVOIvnuoev0HchDM7yfET0RZmgCMTnH3gK06Ubk+HOfjILs/xCSYMHaXPrqVK
         wXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+WB79DnEoNX/DNgTygCiusE+WbTOlCrDxs5hPLkw6u4bgCtp9P0E71Sg7jiUDycvGJeojesZmGwColCk4W+eS@lists.infradead.org
X-Gm-Message-State: AOJu0YyjHx0l91eVjnHEB9sB9SJ7Jb3LlcxaFj8Jqiy2Xon0D0gLIh+x
	mmCLPuhUXcnOaTpGDma7LM79+q8Kv650gATU+k8MlCx8SLBPancImnhC3We5
X-Gm-Gg: ASbGnctt3R47KQqZNtCHTdxag5eANhrHOFxkAiYMsKD4ZVPRScP/6cgHIpLD11oLo4h
	9XdIvx/j6U+yrv7N/Jh56FmOggswYn2wuTAL+pOzcTVV0u6Y715vF9M646exoyEPaDBITB831Bx
	si90NPZEvQI+0nP6QObnLXVDx3JqK3/QKvOUetjzA0nkO0s2hwkvcQK/dwd+u51Zif+h8/QjUpy
	QFx1+FZjzughKL1EYDlIP3nn3yEHMTy8tH2BYKTKh7gji6b/OloTFbcroeTduC8VuS2BW3E5RuE
	zdHMcyIK4FGaEEumLuHHyG0iCx2mlueUASs=
X-Google-Smtp-Source: AGHT+IEX5ltlPfLCluDI8+idUv9xGtQd7mdwsOJMFE8fBqKtIfiU3iJrIQi2lCu8IGFrW5vsWloWzQ==
X-Received: by 2002:a05:6512:2346:b0:545:e19:ba1c with SMTP id 2adb3069b0e04-54d6e62cb0amr2400614e87.19.1745213839491;
        Sun, 20 Apr 2025 22:37:19 -0700 (PDT)
Received: from localhost ([185.53.22.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540849sm831853e87.53.2025.04.20.22.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 22:37:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Apr 2025 08:37:18 +0300
Message-Id: <D9C2O9CUCJT8.334ZUG6YS2XA@gmail.com>
To: "Cristian Marussi" <cristian.marussi@arm.com>
Cc: "Sudeep Holla" <sudeep.holla@arm.com>, <arm-scmi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
User-Agent: aerc/0.18.2
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto> <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
 <D94LGXDHGVBD.1GB1GHOWORHMU@gmail.com> <Z_zJbRH7vQ0TswGg@pluto>
In-Reply-To: <Z_zJbRH7vQ0TswGg@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_223722_194271_58865627 
X-CRM114-Status: UNSURE (   5.16  )
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

Cristian, Sudeep,

thanks for taking your time!

I'll figure something out :)

--=20
Best regards,
Matthew

