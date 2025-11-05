Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAD1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io1VyLd1gRAuF4noSMJeCvamZeFl5b2WHdevUDZuHy0=; b=oaXY0LBlDFJIz5Xa2gZfd1N6fK
	c0fFctXQAGjidmuna90FzRIUEWlhnaPBR0682h4Vb76UuZFFgGumxRxXzCTZ2O0x0KBZzEN9spEsX
	b0Va8AITqjmnuTE/ljhjFEO821F3GXVXtQHhyoKm5XkAhyeVNIhwY0FTTDRGt5YU2T0nD+a9tBqPU
	r+7aIAEDeavBziojkzhN7WVPn0twIc+AXZ8aSePCYTtTNhk/Aa2VPAFzFeVIKG6xsO18jHC2MWrj1
	cDLA+aVYIzO3zsQnZniWD9RGQXYwq5Rb7dsrATGIvPGbg0Bf1+z21RoKCUHXdsfGAqazBKQDzWqwK
	pdQGEE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfrJ-0000000E027-2KXD;
	Wed, 05 Nov 2025 15:55:41 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfrG-0000000E01a-42Mo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:55:40 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-591ec7af7a1so5915727e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358137; x=1762962937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io1VyLd1gRAuF4noSMJeCvamZeFl5b2WHdevUDZuHy0=;
        b=FboLYrpSd8UVEPzD7nc4TggvuOQ3Y/OPQYtWUsM9KvFF/9GY66ORyx0wZw3u8AWdNd
         ahwQdIYkvgragMVHbWf+5zV9oEisvJSCD3T0iw55lyDySkvvDuzmd2CN9bROpRdg7Pe3
         45LBznF8Wj1ZyNVISsiv7VCok38/4c+okD74+smNSYlo8GKq/Uu/KIetY22w0iKPuz8r
         JafOiuHOvSIysI18uvMlBlFiZWSdUKQO5A9x1/N3KmBSj5SWem8g8Y9DA1tQoPA4bQfx
         pN5iXr/vBFqAN24GCaNtFqr2sXGIqZdqix/2z/VLJTrg0MqXCYc0xyg6sUCusGEr3cWE
         oF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358137; x=1762962937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Io1VyLd1gRAuF4noSMJeCvamZeFl5b2WHdevUDZuHy0=;
        b=pApnGQEdAdm43zj+HYEHlgRHb+JGg3hOciUjcz2YE0pQb2Ew7o+SHHbnMo5zpCQbJi
         9/RbL8f0Z1PZ+UxP6p7GQqD5ydxo0ULN4GO61jIW9FEamdFd6UDEpGtLZCjfbEULOI1M
         Wzs5cm8gr36tjvhn2qy2CbxhQfgQ3E2vgXFcctrWAZVoOjNu/DknaUOVARdfx3kMf/i8
         MziTn7IOm4MJMnR+5EmgKE9RM+2SsdGcKLt5G98l21A1UMlSSFGCyQS0Fv44+av7TyU5
         WkO10dqHXcHv2dMLC8bRJxMwe1EedESLzYYx5a/UhOHN0DWAag8e0kGXXE/PMCQbpO5r
         vwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT27Y01WmyDgwGkyKRRI5j4J/D4AsKXZd5TFh7PY4PpztLBTuktnnAzmyIAM1oSn1jufbcckXLbJHpLx+Ja5Lx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd+SbcJrowoIctBPXkcUJHqG6Ikn+0aWGmxhAPVGqKHXAOFiga
	uAvY3/u31HRS0v+EGPTdazUN6FMN6I3TF+lkH10qtFLsJlVCko9gOjMLwDi73hIK3iWEdrQBCM2
	w8Ux4+4fjjGKMlOBWy5i8EO3pIKsD9L4=
X-Gm-Gg: ASbGncvGhBDqF9g8Hr+hjJ7WU7xKGCh5ILw53mIG8dermMcDEEps5QonBBiKy/H8jqn
	4h/R8d4zX9lTrDH1ElUS0XHNth3eP6RmLS6o+xKKYgPLYUgDerDC2CxmENRsfoNJyMdHxi8ljyg
	FHSxg9EUarsYXdTxMKXuyOB7NHONWmJdWfVaZhi/ulbShS4HOpm0VQzDCHRtGg/Q7hCutT1GdQ1
	/nx+dsLHDh1lG28XvnisUcDmVWC12hcFkYaHdERIpt04l54MMOYlVh2GUsohkLiKZCGzodfYGPX
	kEpe2in606L6oUuc
X-Google-Smtp-Source: AGHT+IEKZD2r+A6glfOrMrg4LC6QbMe/1oJABd/0/CzvD1LhjWBFWqHF/ZzZ6hEZaZ4L0CrW3eHh11z1a5+Hf0RYLbg=
X-Received: by 2002:a05:6512:1390:b0:592:fc68:5b9d with SMTP id
 2adb3069b0e04-5943d55dbe3mr1269961e87.10.1762358136484; Wed, 05 Nov 2025
 07:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20251105152555.1992513-1-michal.vokac@ysoft.com> <20251105152555.1992513-2-michal.vokac@ysoft.com>
In-Reply-To: <20251105152555.1992513-2-michal.vokac@ysoft.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Nov 2025 12:55:25 -0300
X-Gm-Features: AWmQ_bkzywn6dkKu5hKn_kdsHkqaeTB3gPh3L9WBztucxEsOta2CD1J3nctobCE
Message-ID: <CAOMZO5AKmKWciyF7-f_mVfJWdLB1rjh_Xi=BhkBAcmV=cJ-nyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6dl-yapp4: Model the RGB LED as a single
 multi-led part
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_075539_007108_548AF964 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, Nov 5, 2025 at 12:26=E2=80=AFPM Michal Vok=C3=A1=C4=8D <michal.voka=
c@ysoft.com> wrote:
>
> Describe the RGB LED indicator according to the reality - it is a single
> part containing all the three R,G and B LEDs in one package.
> With this description the chan-name property becomes useless, remove it.
>
> issue: HWOS-816

This issue notation appears to be an internal matter. Please remove it.

