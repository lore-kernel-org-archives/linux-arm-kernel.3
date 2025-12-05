Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A30D2F7FD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2g5UQqK/xohmelVeTB9J/O7YssHoDCD3YBN0y3wfbQ=; b=l4KICUAt3yzDxVlsjPhag0Lqmt
	8Wbk+aFyGaxiT+we/j+y+fHF+4mN2mbq0RxhMHJXirrRPfJFFXZ1TatHKMLmmN0mNXgVJLNPCoASj
	ZNdNOWV03P8nqcCAFn18n9m/5llOVuxGU6sek+ratDEJRQ1LkqeYimZJn+TopWIcTJkTQFDjMZ+0T
	Nv1eog0lRWhxUVWrrQf1BkX3zWIYqqRCsxUQ7dSKdJH5qFWRIu1zHTeqh6c6VsahcbYK0jNE9Cw5T
	+SlkCf0ZalNDyihgMN5jxbuytMdmmgxf4f9VgpeYuQqjMq+CSy8VALc4KIHdpQ5LAdn3nI7j+55OI
	F0buXBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWc3-00000009ZUa-3aFT;
	Fri, 05 Dec 2025 14:16:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWc1-00000009ZU1-2lBe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 14:16:46 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so3087122a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764944204; x=1765549004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2g5UQqK/xohmelVeTB9J/O7YssHoDCD3YBN0y3wfbQ=;
        b=dBnP1vdVjqnDCprrlO254m05owHVwFOJJZ99hLsWprXKIJSRkRLA3gGFxOVe7nri5x
         XcaM6Jqn7Q3NNwiayvqdNmTX9JjS8makOfl+HOOIzwSKBs7O66XWb3eRLBVEI4X5wpFX
         e0gYLK1SNaCDaP3gn+gj2Yd8nVK4NroRumRlaBi+tZQl2+5N0TAw95idpsxzEn8NQpZO
         ONnNktgwUI9Qo8cUsJQBuxS/G4z1NNuit1m9dXE3G7rQFhgVRkdqL6f2cVRzgydy/Qzs
         y0am5k9mpq8t4khlWtymPZMrSQ1etTj8g8vX9cMzsiFjFAKqadQsWwJ/FOhhx/W4cHe1
         X1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764944204; x=1765549004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2g5UQqK/xohmelVeTB9J/O7YssHoDCD3YBN0y3wfbQ=;
        b=r1gTtikFITc/hZAT+W5dtzUzAAjmpf753peykm1NqarylsQV+JELFInSaiz6oD4dbZ
         Rss2mKbMjxrpNOh8u0cvLzgqwMTkQRJhEUgnZ64XUakuuyeyYr87K28NdY7OO1LP1p8d
         Y+PTR5XutroLGlgC2HaeX3QfQzMH7FB5ITb4vL0xlLcqs2k8stnrCoLFtk/HNaNmhpe1
         9sQSsGexrmFEDp2QjHM6YfBPwjM/Lqo0bB8O36bm4AXSxNmjKtmKYMTKug+ETvSIcfNm
         34xR0pDD7ME7K5vx51UF1OOx3r2JOWYzaUbbrfKHj3CohtzhwaUNtYj6BniEm7WdJP6R
         QuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDxWoc1tYF0WJ0q9z0U8ft3z92TIdnTIYOS8ly9BMe9lamniQEcuP+WzkKxR2kaHmKxDrMOqm7BM1bfLnS8n46@lists.infradead.org
X-Gm-Message-State: AOJu0YzPZkLno1GN+r1tVZe7QjTkBo1kqQkgTjTBUbsydrNF2DCr26dN
	TmJ+jYDzdT8fviQTwQulNt5B2/OOX8PPJzVY0f0IPY5uJBnUAO4eLrbIa+/b3uZwKySSy8yMd/u
	2y3XF62UKq1KwZ3+x/AQfxPKeevmM5ag=
X-Gm-Gg: ASbGncvjC3sh0Ys2oGSwijQfQj1OLVRZWT5SjYD1Mu4lR7wWCuOBQRmkxJ3uvMPnsLy
	/BIPStsvcaaflgYIDrUQzXN/0/enSD++hIfhgGz/KIf5XpU51PBrpDSiZKULG7y9MeJFS/qXjJy
	abc1R4cneAH5Fi7Z09A2p+7wFKJ9lNlzLAOjqU0KM6NiGZZc0yZLcTgCaX1vi6iFcpmV8v4tsVr
	5b6O0ROncSBfuXgd23mQHQ7aMus5Nbw0oLLV5N4NDg5ui0ZAcpZ/oqZzp7bY1cDLj7kEiva
X-Google-Smtp-Source: AGHT+IHceS+AcOZ5dW8w0Qbihdbu6HTr3XGszoy5BRb8+hd9e12iZk925rUFbcfaGYdUXSUHXwpDuM7CTOkXnm9/rB8=
X-Received: by 2002:a05:6402:35cb:b0:63c:690d:6a46 with SMTP id
 4fb4d7f45d1cf-6479c497fdfmr9553716a12.13.1764944203595; Fri, 05 Dec 2025
 06:16:43 -0800 (PST)
MIME-Version: 1.0
References: <aRW4PpPjVw1-melm@pluto> <20251123163557.230530-1-a.shimko.dev@gmail.com>
 <20251204-slick-granite-chameleon-58ebc2@sudeepholla> <CAOPX747pTsnTzKnaai-ytnmcf6reraTTSk+mssvHri4GMhCsOA@mail.gmail.com>
 <20251205-calculating-unique-ibex-de824e@sudeepholla>
In-Reply-To: <20251205-calculating-unique-ibex-de824e@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Fri, 5 Dec 2025 17:16:32 +0300
X-Gm-Features: AQt7F2o6ZhdTfprtpRS_RXzzsEVCCZ1t3NBhD4shQ8_Ku4ZiRAv8S5HC5LZ7bEI
Message-ID: <CAOPX747Nk5jOYREOYKO2=Zn0C-Zb=TY-nDbL_LzxbR2qcteexQ@mail.gmail.com>
Subject: Re: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_061645_705033_2E260744 
X-CRM114-Status: UNSURE (   6.43  )
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

On Fri, Dec 5, 2025 at 3:14=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com> =
wrote:

> Let me know if you are happy too with that change.
Yes, sure, I'm happy with the change. Thank you!

--
Regards,
Artem

