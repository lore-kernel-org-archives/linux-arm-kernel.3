Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F68C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4OSOZ6QNkL9RkPJ9OENWBp9oqWXQ7z1vT7cr50A03I=; b=nRe9e6Va3cueg48aHeTXVeORnr
	ZOJNCA67JYGTjoh1EJxuozLSk5c8KjB949hzQtcmEUGQL0gz0pINXFd0I2VdnUBlPnLTRXYt386oR
	ZdoF5b4D+1m+BeR1QZClBrw0Dpo/pFkLIuM7bbcUaVLrYhWyv3n8RKZH/apdi44tiGJOo3vJplEio
	cG5Mi6qUkYYcX/+/a+3boBjz+n+fKH6/hBnqW/4khdgA+gsn4625ZSxduG7lezlpxduSyG+SAMigG
	hlKQxYA5e0lbUtxGSbIYTUlKjJwdM5odQsf4gZZK+QSHghKMzwFwEL6LmyBvBGEeMpZc0DOv/E1Be
	vjACGb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JWO-00000007mgf-2UwV;
	Wed, 23 Sep 2026 09:44:12 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JWM-00000007mfw-1L08
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:44:11 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485843116d2so100202f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156648; x=1790761448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4OSOZ6QNkL9RkPJ9OENWBp9oqWXQ7z1vT7cr50A03I=;
        b=nsSWw36BS9fHoz0rmkkBfLULB5rTca4Whl4B/GIPVOhkN9UUfKH/XN5LPEtcjk82oI
         kV7dMKtoWC9jy9gBeYKs+4kGt+NWs1B8UltxZknAy5fW2Bx+BV2YKPhRNJLVjb79Ht1J
         Z9DZR66XjFMSi3V3F6agmQ7u0qXfgp2VhG44YTk7IBDr+uswQAj0GYo6vT1w/EUPFjO0
         EUsH+C04JfSvOMxki0bMNIs87H1BbnkJsZx0jdp5QOTiLSaTgs32UdoYq4z7po3Bqniq
         UdCFPKtDQUdMobnLRKGjW7TATcOAqrf+62t2e0Z4IOpAA6YkbYYkKnvkWGQpwGU2flW6
         3S5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156648; x=1790761448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4OSOZ6QNkL9RkPJ9OENWBp9oqWXQ7z1vT7cr50A03I=;
        b=ZrWaCqPTPJVX4zIeRBJqxtf0Vm3125GQNOBEFSDPN+yOGTpxC1LkO62fi81U89NCmS
         nrucTVo4QRH/lrw92pqi6fh7/XHCRcVKadhjSVyzFOop+Hh8V84HX20EXe5qbeP8IO52
         71L6OMofHcTk5Cs1wAHXrJUxrG38i1fSUO+VptPMlgcqGWxOWwfKMyaGtpW4gqKr5Ktw
         M9/bfAuOiY3KchE0NJJdyCIVXz1Ccu7vJdK1+DCa26O+j5LpK//zTxqmwNrh3m9ZoKCG
         mJ9P35drCPQ2hdjmGvvKDFUOKXn04Quomtstq5WZKbuQn4OHs79LFaKS4haQMAGo0zFH
         EVAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIrc3BPzyVFfRa6NcUxidBf9XMwHYeXeKF34ibffQoIgDTo5d++UeKdkIkPmiyckkqgTN1OQquguI/3WS20gpa@lists.infradead.org
X-Gm-Message-State: AFuF++l7/zXUO661fs9RiD334tAsXRIMevHW7UjmhjLtJrCG8LkGdCwy
	p6tBMPGXcU3xkrGsASJwB3dbcsm6gfJaTPQUIT6X48vvCRf0mSqvQ4JJ
X-Gm-Gg: AYBFou3NlNlMUOrlpqC/hn1guXrcE5WdbDhvGUEH2T6MjZ33/SThPDWmOyNgyV5YPI4
	QyMIelmbc9/wSnQJCcn9NHUhCiB0LglwxKXlEcQRDxTwNvXm+qmF3+lxlBR4baK085inyf7Vc2P
	jUcyDu1iwEEi/nyvEHfMWpshnkuytF97NzPSHEifVTofWQWiskHDXD6EO0Tf1qRc4iE4neUysH9
	yujf4/uaFYKVox63VmMk4KDwdneW2HBBd0QTGaD0MaVrEnrQ4KAqvKUzzpL/kj1CQLUWHmmSfOK
	8AgzVyZ8/0Cy4jEJgQ0m0WXbFBqZK36nFP8xFFH3V6v8nxMkBbVaqMkAoO+SiX1vDVTSedclFFK
	m9WeHsZL0HBKvCqKjUe9Zc/tmi4t81YDij/oxUjewg8TgKKSqzSMW5xDXyGcF8m0y6FcWbUdDdL
	i48/Tn2/cEnqzwT48BxrNDMbT8wh0qZbe/ZQEfEiURktSjAPAfI2VDyI/dg2hpPuKmONzZ6LHuA
	KUqdOL6Bdbx1yrAq5p04Di+jmPeHHQ05L8xot3iMJdFB+9h1NHoZ9kt1pKzJNk6kBNhkH3+Ryd3
	r9s=
X-Received: by 2002:a05:6000:41c2:b0:487:240f:b0b6 with SMTP id ffacd0b85a97d-48866fec88emr3319246f8f.0.1790156648286;
        Wed, 23 Sep 2026 02:44:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm5535223f8f.0.2026.09.23.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:44:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Diederik de Haas <diederik@cknow-tech.com>,
	Rob Herring <robh@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Wed, 23 Sep 2026 11:43:53 +0200
Message-ID: <20260923094353.20318-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLMKYI79QQRS.28Q4ESQ974BU@cknow-tech.com>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-7-royalnet026@gmail.com> <20260922160602.GA3529337-robh@kernel.org> <20260923085755.16219-1-royalnet026@gmail.com> <DLMKYI79QQRS.28Q4ESQ974BU@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_024410_395818_BE487A67 
X-CRM114-Status: GOOD (  11.45  )
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

On Wed, Sep 23, 2026 at 11:15:22AM +0200, Diederik de Haas wrote:
> On Wed Sep 23, 2026 at 10:57 AM CEST, Igor Paunovic wrote:
> > Will do in v3. By the same reasoning I will drop 'dtbs_check' from the
> > two DTS patches, 07/11 and 11/11.
>
> Doesn't the same apply to 'checkpatch' as well?

Yes, it does, so it goes too. In v3 the trailer will only name sparse,
on the patches where it was used, and the DT patches will carry a bare
'Assisted-by: LLM'.

Igor

