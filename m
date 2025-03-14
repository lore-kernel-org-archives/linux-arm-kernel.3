Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CCCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBq11ylwu5R382gZxqzXZy+KZY3NpzkBPWG/tVivh9M=; b=jE3PgkqEgdSS79siC4IuXK2cBp
	tixmzIUjelKKCTHIMCNlLA6J6DstjgQeMrbDGmsOwlPUiMrDB/2zH34IW4LFpbyvuorVNfKfM6vnC
	mafOCr2cbhntBjTMrwE6nKdS+OM3nvMWhrwsRrvg71VCzRBhmXtj7TLxqesNXq6MgW2q6b+Xydvlv
	K1HKY3YpJ1kPcpLofqNK1Qx6xanb+Lr8dPNxBVosYvhDz32zS3TiZ+T5QlcQu0WDeHPljmd03eo0m
	tadxA8Z2crQs7111lYOX1JJh2PJ8vnZa2E/BT5KIbiF8pm+RX+o8zd/xmTMaL5+o+Mpq1FFnJ09sK
	iv5Bmbyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2hN-0000000Duoy-3kwi;
	Fri, 14 Mar 2025 10:55:29 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2OV-0000000Ds0C-35SK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:36:00 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-549b159c84cso1929656e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948558; x=1742553358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBq11ylwu5R382gZxqzXZy+KZY3NpzkBPWG/tVivh9M=;
        b=iMS6uas5hg1aRHYVsy1DBdE/UqVbwKdjbJKXk2mQuxyiZWeXMWhvhEW9tvTxIcmdPt
         YpboSxCxSOfChpmYHpsxY3ibY9N7ca9v+bdtAlmW6BOTNOaXo6/o1QyJGQflmxAuhXnc
         VPe10JZetFtM9qOXscIvm3QPdxl67uRHlJgSlHkgp3U2XJulT+QuGWUQG34Bw6XQyW0c
         vjkxOpl1kGuiQBcgvcNFwY8lLx9iTWfWGeAlsMrQa4G2hy7xQIgSYud3hbHn/j1cbZ4e
         b2/nkG4DKynJn2YnCzEKEENARMaCFn9axZ3OVEmKef2BVGp94Z6hPwp436RlV+ehefYG
         FA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948558; x=1742553358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBq11ylwu5R382gZxqzXZy+KZY3NpzkBPWG/tVivh9M=;
        b=UpfyU1wckWRFUESEivMBQLGht2fh6OIPxCfyCYHKKFQg3G4PgCrCDQZuv/59QMnDgk
         BHKEcypyISt7QtPx/qMoJQqW2Ciwxq3JilNC6m+/p+a3rDXJLtla9D1E/SZjhyW3bW36
         OFOfnYICfDY/Z6fDqdkuoNo9rmORWpOmx6WpMA5GSTBgdcYxw75BC/xGXwnWuoywobyp
         xeXDw4mxDlIE1YkMaJ2k7BE++Lp5KQg/pkFmec/3avRooEov5iOKYpOlXJ6Uy6u9p858
         nS889JLtXBDsT9OaBOuRWAv8zgBzQtNKgh565yE5ESspcSqNUA1Ydrt8Cxj0E54tLmQe
         yOpw==
X-Forwarded-Encrypted: i=1; AJvYcCU22xmKgfI4m/hZeYKZjZ20XrtmZwwM8y9a5k1npoeqVnBRbCHJXJ2RaQRBOr9xLkIeuS4pPLojqAfT7zLtR+1S@lists.infradead.org
X-Gm-Message-State: AOJu0YxDsxISqbsBHH1G8mxTO+/df4qbX0woRUdJX5RmRcBXESNhSKcz
	ngOJy5P8A4jwPuv8OtXnY9Lj5/8YVHYDtESBV2C8pis6wy6XhJUrr6CRUt5QCBCi1ORoVienw2U
	ZYmYNdFHdjG6BpQVJwYyV/MXa6N4LMj6hXRR8pudh9qhSOPpV
X-Gm-Gg: ASbGnctAXPEwBjW9dnbPAQB2jABgvnjAc40gjD8Vkt8loYiQFDZOtLVW+zMsdgevfyT
	Xf6dFeSRZr8xW5nJAosCqKhbjIpc9Tpt4f9/43u0fKdjyxnP8cWqZRTB937vvSp1Gn68wamyBai
	GDCzPgNpfyXo2NY94gG0uUtV8=
X-Google-Smtp-Source: AGHT+IFo7a8aP8LrtXsMzS05IJF+N+ZjJx5DRyPZKzboYtcGh7BYc7nkwi3Kg4DoP3cYib1OWjtVARzILEhT3JyV8rs=
X-Received: by 2002:a05:6512:2350:b0:545:2b24:c714 with SMTP id
 2adb3069b0e04-549c3911e6bmr755718e87.18.1741948557930; Fri, 14 Mar 2025
 03:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
In-Reply-To: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:35:45 +0100
X-Gm-Features: AQ5f1JpewYNdVReOE7yOz7Jhb_-0BXB-6RAsfqpo9dfZwpZcAV2B4PUacGG94IY
Message-ID: <CACRpkdYkvTr9ijyEVSzevHdHFDb0iJTOzCS_3gQG0eNcpR7tcw@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: bcm281xx: Add missing assignment in bcm21664_pinctrl_lock_all()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_033559_774528_5F6EA835 
X-CRM114-Status: UNSURE (   9.31  )
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

On Mon, Mar 10, 2025 at 11:48=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The next line checks if this regmap_write() failed, but it doesn't
> work because the assignment was accidentally left out.  Add the
> assignment.
>
> Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij

