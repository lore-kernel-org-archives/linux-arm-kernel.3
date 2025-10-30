Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C46CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 02:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0iJfSZcYi4d+4cBtPvkDIcUkSGuJygcNQUXASJtpao=; b=fFreefYttZ+73kfDfrsyBhooou
	E2h75jCy/E4WXR0R6le9k69QL3fOAJIDL+tYw3VnwkSefm08yQd6f2bGAPL+K0zakrBwRQn2ThKHl
	HiF00qSSau7wP9W1M6HipVfEj7UaaH00/Z8PMpbm7Zcz/EYSvgtfAQ2sCOAQ/ZcGZnk0gtIhW8aqF
	Ic7kbfZhgWp5AmigBk4eJaammI7ZKVITd3rBVXtKMAFWnu586CC8kDH0FwHiBNfwVUQsKDk5OywoX
	JzucpFGHD8o/M/fg4VrGA1FgjML4CiwS1h/qVMUqOilGKk1dBmbsfDpyBk/dvO/rwBB9JvvBhnn3V
	Ijl1Aw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIED-00000003Mph-0U2p;
	Thu, 30 Oct 2025 02:17:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIEB-00000003MpI-19NT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 02:17:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a683385ad8so92366b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 19:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761790646; x=1762395446; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0iJfSZcYi4d+4cBtPvkDIcUkSGuJygcNQUXASJtpao=;
        b=nbOJrqQ0AwV09NG8DgRYgabehH5bFk2LmpDzXKglEXwqTya26QRIntmgcbKTpKCVfX
         XYK0G1fk+AzfNBvJ/folHlGw2A5iTDGuo3+CQuJDokbEPsXnVJa+W3NPnv/fmT8njbYB
         Yvk6oOv0To4PpZQuRP4FRaWvYIIubdwo8bT6yh42MAkw195/cpUKiTAKXScOyBZvKAzX
         VlvtQ1dQAXKdhG8oljsDCfo7WHEjPhm/0I3CV22TnKfGwjvArHA+N7AUZl3PQLmcV0bw
         WHmw8qOy24UIxpMyCDWxAcIGTGtrlpaxXqVZFpAQY1pedVNgghe4xTu3MTp4aH/u7hCJ
         +apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761790646; x=1762395446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0iJfSZcYi4d+4cBtPvkDIcUkSGuJygcNQUXASJtpao=;
        b=wxkpUbTU8U3iG/xzXorPeeM1nKGELjA+S+7UeX84MplbdMW4pi1sDFQ1X6aCTyUcsZ
         oZlv41RTZZA8UtgwbF9mDmJ9XKm91qHdNTZdnD+xVoNuYBbqm+Cza8mBRv3XVFZfHbaJ
         ZlwOBz0el9AngbO0W/QWMqeY3dB/Icj4u/1vDqH/5R4aVjokvgWWog1MxXsRALY84aDC
         L9dIuBARlABksGNQ7cs09P1lfs8t/4gGv4XLcqg+dKehi3NijXgPiQ+jh7qlmPzqzJqY
         k7K1B6CwCrTHcRUXmoih6Es3lKpeNEmfcRfCne6XvSanFEB2z7cdfb5LBATeVXHIOdfW
         VKwg==
X-Forwarded-Encrypted: i=1; AJvYcCV6B/KmrHxbHWv/RI8h31DNm8N74sMGzivpHGCske72Z/jN1kbqcr7ctvgjuFxPXwT+rA9C43/UFdxlC3spTXPC@lists.infradead.org
X-Gm-Message-State: AOJu0YyzQkfUHezRWmWyKFuoXZ1csp5lSCZIdlCnGBVQqXYlyenzW+Gh
	P05IYtKeevsjCiGqXhEvWFhrT4nen6sqyooo10x+MmuwFk5c4KPalPB1
X-Gm-Gg: ASbGncsh08lL9TQDxvpSc7pxeYVkVwqAy6ea0SdpFlr349036mRM+Abe9FHeN1Ash0a
	I1xfzFSbDTtj9zEKaMn0jFcqaSFpiRu2VDaRRiqqNr8+b77Mks+xUwaYvznajQF0LjvX5jsFbeb
	ozuKnVpnQ/6tDOrNrJwXmYGETahi74TBzoH60kHugJsaGE8LYDrpSkBQbDmtgII82Zxa/4IGUd2
	IU32v6QFjJPok3nLO19PSNo83nct6zKVwqjXKyw/iMf9/6X4cgMNr1KYyjrohTwodYwoU8YXK3D
	sKrUypq6TlNRci/Ncwufkybkxc/IDC3h04ai+OZ3OhVexJ28kPhtJXLVNiw9mKEzq+qDtcjmavl
	yQmICUMrWI8x0QbngLmlBBv0FaRwmFbK1XR19Xqt9GpogXWcw+HVVzjnIAKkWEMtF3i8EnIrc/T
	U12N5l758pxg==
X-Google-Smtp-Source: AGHT+IGZqbW0+/S17J6RDbXZnRIU8hSK1Dmm2Um3L8P8CRvPomF8j94cwh/RTW/K/MdMyX0p0nhaJA==
X-Received: by 2002:a05:6a20:734a:b0:334:97a7:8357 with SMTP id adf61e73a8af0-34787d7d88amr2092916637.60.1761790646348;
        Wed, 29 Oct 2025 19:17:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712791576dsm14913433a12.12.2025.10.29.19.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 19:17:26 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:17:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
Message-ID: <td7eseq6rmc3s2ecvcjyyyn5feawjmugzb4ihjyviquro7dv44@3dosfqam6h7h>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-2-inochiama@gmail.com>
 <20251028-parka-proud-265e5b342b8e@spud>
 <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
 <20251029-fading-expulsion-f0911c28d23d@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-fading-expulsion-f0911c28d23d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_191727_311944_88A2280B 
X-CRM114-Status: GOOD (  21.93  )
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

On Wed, Oct 29, 2025 at 05:54:49PM +0000, Conor Dooley wrote:
> On Wed, Oct 29, 2025 at 08:56:09AM +0800, Inochi Amaoto wrote:
> > On Tue, Oct 28, 2025 at 07:22:37PM +0000, Conor Dooley wrote:
> > > On Tue, Oct 28, 2025 at 08:38:56AM +0800, Inochi Amaoto wrote:
> > > > As the ethernet controller of SG2044 and SG2042 only supports
> > > > RGMII phy. Add phy-mode property to restrict the value.
> > > > 
> > > > Also, since SG2042 has internal rx delay in its mac, make
> > > > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> > > 
> > > Should this have a fixes tag?
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > 
> > Although I add a fixes tag to the driver, I am not sure whether the
> > binding requires it. But if it is required, I think it should be
> 
> Kinda depends for bindings, amending a binding for completeness probably
> doesn't need one but amending it to actually permit a functional
> configuration does. This is somewhere in-between I suppose. If a driver
> change is coming along with it which is likely to be backported, that'd
> be a vote in favour of a fixes tag here too, so that the binding and
> driver match in stable.
> 

Thank you. It is helpful for me. And in this case, it is suitable
to add this fixes tag.

Regards,
Inochi

