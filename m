Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B2E67803
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 18:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=; b=vbyo+Sv4gD6jBSMjNmXdJjkMpI
	GSOIif1592MrLgwjIhVZUz70+oyzg6DjyKZmt3gU4tYRw7dBkoPwQNjGvFUpgmOg7Ti9NKqFFjYNy
	p6TlBfI2kPGQfT310/SUYsimN0FSZ0pg79MgukG5C884kRThQfkRuVXQSJi1W4Tesn2aqm27FrjtI
	pC85lNrjiAZaWoz0Jm8HO92qOHWlVpSvAWnSXrp3tbhoC3A1ON8N4Yy4Ikd5BtN1XdGYzQMyJt6wJ
	6HDIDqy1NUad+lN23BHlOxGbkZfEy/lX8KEY5/NOQPizhdA4w0NvTiVqTgxiqti20BAWgbzkgfGCh
	lSf5EdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkLw-0000000E3E2-0O3g;
	Mon, 22 Dec 2025 18:09:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkLt-0000000E3DK-20eU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 18:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766426988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=;
	b=BIl/v2FHp1rvioOgjFCfRfYHJQDusr0YFhHuABEV0YQ3jacqvlT+MJQ+91VUr4S7+yyLQ1
	IP9GIwnyWS/SkeSs1yWOKvwnSEPXC3ypdeX8/FAoaQhMMcIkMLqFEfekrGfbfpTcDWvbZs
	esEzUPaMAFZMjuQDuyuqQNy0hfLzjSc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-LFnYnvj0PGKSuyP7UP8Row-1; Mon, 22 Dec 2025 13:09:46 -0500
X-MC-Unique: LFnYnvj0PGKSuyP7UP8Row-1
X-Mimecast-MFC-AGG-ID: LFnYnvj0PGKSuyP7UP8Row_1766426986
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso99478961cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 10:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766426986; x=1767031786;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=;
        b=VApuJxJ+fiBox0wSx4BJkiXPWFPxU10D81xMqUZemoIpoLRXQEvRteBdmZ+UpsBeou
         q+9+ZhFfi3EQmV2uT6ontYxb5sKRwu1sdjc95FO07KS58EHXJ/bqhhzuf/g5ApnagJ4j
         G+SqvHE+WgBgNvLbrTYERZE9/rzhaHL6AlFqSey4qrveyyZzdPX9e4l0WLZpxT6yDwFW
         r8CkFyILwuPth4pUt9HOUQioec4nQFk9YrEFm9Uao1oBDt5bx9GawanSpdGIYeLL2n8o
         xWe1cgUFG1GyqAhvSi4HDDh6t5sLqqBI5JEna61s0kjzH7DjAik1RTZg7PNu6DqgkG9a
         f0+w==
X-Forwarded-Encrypted: i=1; AJvYcCU0zaaxTlhb4QzVKtwqpG058nlT37Liu8+Y4+726qKYecDb13covmHuIBmzHHB3vlxRDnEBzZjVRFX8UiJcoTwu@lists.infradead.org
X-Gm-Message-State: AOJu0YzxybarhvzABnkDVg4GqRjPz+PVd5z+fWA6yFanGGL1QxPgBcyb
	k83ytIUrJqX7OPhtPB4XuUGEcf1DiGz71UuzWFGIKSA4IULrR4zSQGkSlhrJaI/sB0FcpL3W1Fu
	fHUGf8t/DrYElIkDQFA1BA5yvT/7yePN8cxAu7HkVTUyZXqfNVZbwMN544sT87UkOK7M92EkF8m
	98
X-Gm-Gg: AY/fxX6/Vzccezsppzmi5V9d0l0sNEWG+VmzrF9WtR3vyOcHfZhyhfpiOt6U6/+Q4y6
	uj93f3dJQWxlq9+dW1igW3+Ul9Vfwy2gyTGXfxp8VmgUWCJ9nAvSYihGLI9t5G2k6AsYrkAm/al
	cEjhyw0jrMrGKpy8K4VxjlqF4qY3DP//+sWQgoAZWoHOAoeH8JfHioPa15eRqJG/mdkRJulSBxs
	KJOEG58u7dxO5szlRuHqbYHomZyLpOKAeFxMOYHH/VLv7zNvzuQp/4HRwlvE78Z06mzr1Y0DMct
	kk/uqjSyVBdlWr8zdXEkcAQeWwWBgVx6LIu/xK1tZQDdeP6+nQsCOIj4MSRU4nz2cJ0W8Gwftct
	w1YT1OqNZD2+9oxmNNuoTMTB5SaMdzScw93RyIbPR8nV3
X-Received: by 2002:a05:622a:11cb:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f4abdc6a37mr166817941cf.76.1766426986156;
        Mon, 22 Dec 2025 10:09:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhen4inuPei2QtIgz1Jhp7TuWhSfPiBiWyK9QaTxuqDdPYVrS4RnzupTyJuPkfHzkoEa0TrQ==
X-Received: by 2002:a05:622a:11cb:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f4abdc6a37mr166817461cf.76.1766426985756;
        Mon, 22 Dec 2025 10:09:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7a08asm89568916d6.38.2025.12.22.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:09:45 -0800 (PST)
Date: Mon, 22 Dec 2025 13:09:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64
 builds
Message-ID: <aUmJZ7o6PpWeXFZP@redhat.com>
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 72qQYk7l79f4j5HJDpNq3zmzC88j_XUFNruboA2xx8s_1766426986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_100949_614692_25CECB5A 
X-CRM114-Status: GOOD (  10.76  )
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

On Mon, Dec 22, 2025 at 04:02:35PM +0100, Bartosz Golaszewski wrote:
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


