Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828B3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYVWqBDuV8m7HidOYvo6oSjOV7wiCQCv03/6xvMA1E0=; b=H+AqoM2zxpfZjzME1K09v9BvyL
	WMSCSQ6sqbPr1dPffEnhAXNzdsWEi/WHzxrj4w1cnerGMl24/ZqKIlI/TPkYMTbhq9zRNezW7T4P4
	pvkFQ9gZamk0/b9JBojuBVbyNpqdxncaqkP1EcBP/Q/Tt0CpNa2OI8VV/GnseF4uqvC9jU4MdVvqI
	Gvom6WlA/5apGoIjrHaTB/DDFMn86D70yUSFKALoCcX2lquC3lQKJDL2ICV1hgYfSDf2DQjjmfhkc
	hBepMGz6UyZRrsbC+M5T3ZBMaBG6hn4c/RTSUGO34vUBJ76nCdIkO+wvGRMHRAv41UxO/YrSsb9I6
	ssCEoxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5Oq-000000052k1-0UTh;
	Tue, 08 Jul 2025 10:18:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ58j-00000004zqe-0nEL;
	Tue, 08 Jul 2025 10:01:30 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b31d489a76dso3405375a12.1;
        Tue, 08 Jul 2025 03:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751968888; x=1752573688; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYVWqBDuV8m7HidOYvo6oSjOV7wiCQCv03/6xvMA1E0=;
        b=ex47zJH9YdMoFYhk8T2eHs9IRmiQPWsF2yFXSQ2n+FGfE8kD3XPFUPYMqkEoTnvrGp
         au4DuBii0sOI2vpF6drBzsHRqd0AgzE9O2g+4ztO4rmpcf2BGr7woX2dM+KD1Qh9+aVS
         AStNxe0bPhRJMzMqUTj4Re+CaODZBLksCSKokUHhBZ6kSldjZY3SOsY/QZbwm2ZJQPy9
         7EcfV53hnTZGBfTKTCUtg13mohppQNWm765dLt5P4nzGkfbkHIxL0SXYhLSlFE+nWMDd
         jU6JntY7Cc2tDKlOYIQSym48wZTjh/GwsY448VYu9kBhQSIWtlnBaBBBXlXfdNKWYp/9
         hWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751968888; x=1752573688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYVWqBDuV8m7HidOYvo6oSjOV7wiCQCv03/6xvMA1E0=;
        b=ky0IBDqXyBV0n6WzIIAPTy3sViCuEAjSn1Jo3ow1ibiKMooQThc/e0aNY/oRD9aJFv
         DiNAH6mh9MgW6EwknN4S7jKpNCooEZdUtM8INp+oMdOflI8/FlRMpyEul31E36gyrO+n
         HjacgY8YTwFoUJZCg+yXwjvN5lw/dlrJ2xdt5+qj5GX4EkY3ybsXtxOmqPK/zdhHAOka
         HbSJkcRKaml9p/dFs74pchz54870W52KfRuaj0lSdg7yPy4s66qyuZhwGkhOIghyP5Cv
         knbwqjP8Js0g9wBY4VQjcm1aF5uBl8DWeFJJdDcFVikU3iTNZxrlGkgbFH6t1ui6REne
         IYpg==
X-Forwarded-Encrypted: i=1; AJvYcCVagGCUNzuxzzPoGkaPP0UgObM43jzhJAD/PYyif9WGZS82gWwRZ7qo1KdhIkwrP4F09WqSdLBFQVWt8ZKiUAwG@lists.infradead.org, AJvYcCXcx7zjo0U247n4g92Euc2MXBk4FP0YtMJp+aHIyxX6D6FL5gtU78I3DiRn35RTmo4bpZ17lE1pfl1b7yw1XJg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwcqWHCNHdcP+THoo8MML59nMA+BZbB3bgHTdukggubYTi0Wwh
	r6qdQnWbEh4sfykx9FvZPlh1e77KeMPSYQtyeEXDIdnf3cbcLxjwqy7nfutXkmR0zXkFYmPlRIp
	2pqhTi8Kap0MhmmueLTKFwFgcF3Plt1hsnh17
X-Gm-Gg: ASbGncv+y9GSZEnVPcAK5MLcPsSLswStUCyMWR4hQyJncPE+txZ4zeeuKCsn6gRCsk2
	xuzY8cLmsDa6qoiXvoZDxiJO+e8dxnzbnvYuftuwzKdARCQdKcSlIEkhnaux7WcClpZHMm3WRm5
	6NhpruLvH0zUcp/0KNL4NtyK4/lGiTl08ZHKj9Kdsc
X-Google-Smtp-Source: AGHT+IGYKEJK2xo4dPc6y1F7cjXea1ETy9xhjndwr4Pdcn3GQxSSY8T38dioJ0DFG99A1R8cEUN75ggzKI5af6Tbcd4=
X-Received: by 2002:a17:90b:3c8f:b0:313:1a8c:c2d3 with SMTP id
 98e67ed59e1d1-31aadd8535fmr18447334a91.22.1751968888351; Tue, 08 Jul 2025
 03:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250706214111.45687-1-rosenp@gmail.com> <20250706214111.45687-3-rosenp@gmail.com>
In-Reply-To: <20250706214111.45687-3-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 8 Jul 2025 12:01:17 +0200
X-Gm-Features: Ac12FXypn69TyIfigXU2ITYLudOZytlc3g_sKOneE3FvF9rspGTP0tpBLxtSZas
Message-ID: <CAMhs-H8Ts8nreYppvbXFuTkvcEUGCurjUtjMy1XrfVzv4q8k4g@mail.gmail.com>
Subject: Re: [PATCH 2/6] wifi: rt2x00: remove mod_name from platform_driver
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	yangshiji66@qq.com, ansuelsmth@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_030129_225595_46B287A1 
X-CRM114-Status: UNSURE (   9.87  )
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

On Sun, Jul 6, 2025 at 11:41=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> mod_name is a legacy debugging feature with no real modern use. An
> analysis of the underlying MIPS setup code reveals it to also be unused.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

