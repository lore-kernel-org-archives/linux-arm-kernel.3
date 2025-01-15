Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C4FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijQN8N59Y2kmAV+5Q+OaToHQ2NsmsUTEcGS96ikItDU=; b=2SHan7TXy0e+qx3fvSxop5NZ0s
	s86PM0OLYTNqe/v+dzjX8dOx37ww3rhpFpWAEMwJQaZTU5BO8UpsYIuVxBulYPi57BOwP116/ZJCt
	cgM1vlkhyNOhxT1Dj7pUDOTJjQ1ESVrOLLBhQBKJQQcK/dJL1Ug/L4WHJE50TakN1M4Y2nL1J9n5t
	jpTz+LLWtDfTtgWn7CDdPzPij5wOywBxVkFdYrRFiMWiKHkE6gZiyLFOajz7qXD8xL8GVScpp2Fm1
	7VD+H5AV6FZ1p2z0sm+3rvd2NQNJtiumKnzoMC/ZhtHM0PxfGfhglno5st2B9b5dARNyCqcmOnKQk
	DIf8HdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Y1-0000000CfWW-1D7n;
	Wed, 15 Jan 2025 17:51:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7We-0000000CezX-0sD2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:49:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21636268e43so166704865ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 09:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736963395; x=1737568195; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijQN8N59Y2kmAV+5Q+OaToHQ2NsmsUTEcGS96ikItDU=;
        b=ISFT8LhV3uTOw6Aeqc3qxBFXrF7PzmybEkoUBQHCS+Nb+5qdSdEtNpr6sFpHuMSnDn
         ixHtqJ80Dq5IJaIJl8naRJzR1puQXW/h44Gd7UIol/LihDGkc4uxaDkEm57dO4cd2sEZ
         b8SXnNI+S0tJNZZUx7RzTrp/9uFZ2xIbcNb43ygU5OJoVXmde8LtHJuNU3bKxhsoo4Xn
         gmtbxqrQfRY+TPJjJBTO9E9OjBXELOP3B6xiekn3zgyHUlkb8BUxzxNHrY4tWHTFDo53
         kt8Qk8+1gR+BynIeAVEs5GqDBohmPe8Venaeao34w3j0nmbHtqF7oke8uP4p6cp7Z4ZG
         WBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736963395; x=1737568195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijQN8N59Y2kmAV+5Q+OaToHQ2NsmsUTEcGS96ikItDU=;
        b=G+Ldp9SJ8E7zlZ+9QyrKWdXy+fITM2hig/JzObctjT2RdXi78tjHJPO+OLsD0MA6FU
         h+O0fXCODDg4EaDXF6NADy14dXvieQ5ozTC+VNLBCGzskiEsGlbxxhf68ac7bSmBQOya
         WlN1EQPoIPPA4javR1zQF9FaCeXLGKTBywSZIU71i0bhRPjF6br5BL1rc8Qiq4X+v7Kr
         BhB+6ulpALyExauaDJOVnPk8BB2Y//VzZym8GySW3LlYpwnHwz0KZ68eH6fZYpk3KaSj
         v2nQ0usEgWSudLrtDd19xoPkhD/4dT/2pwpWrXPklENgyszr42cZ8BEliTTvkWvg2T/P
         gKtg==
X-Forwarded-Encrypted: i=1; AJvYcCXcPmF9Y8pkK1udtwzvBxXRNYTVPGt8GpfIjOiaHH/mWxh7XOJtEZdjoPebUo4YgG0xurEuV49pedK30eOvnH6s@lists.infradead.org
X-Gm-Message-State: AOJu0YxSV6XDUDwb/OimJNb/0GezVTdIUP3lGxn/DNIkWszHi7vS7hB2
	e3OLnfkJIcEQqZ66Ak7dpfQL6TYX3eVTWmAePBzf6PfAoGesizt0V81hDoawVA==
X-Gm-Gg: ASbGnctldKZmQEc+fRSBO+TBm9SuvqqOJ6LxqVk6pqzbME1CXt41cFPntZayz0DT8oR
	akDY4A7SMYreR2phm+gUOAHcylOyoNBC3Rx0/Ari+WDl/FdWv5GhnLOLY4o7lCzyU3fycO6TtOC
	CiMkU5RxjR2zKcJ9Ng36vk53CGWbbkdBpUrQI768DYSzehN4L59r0I1oNtuaXiG/BsufwdOgOZD
	D5rb7hZvpn5cQrDysMmoUU8D8n76vwxzNnwgiY7CK9S/z7Bmb9MRdUeUMrRRJRaNdc=
X-Google-Smtp-Source: AGHT+IGnU19XoiVl4FcDEe9hTH4O9Bmvstejs7dclj+OyDqpDeZQevJgsHyuy7kvgQQPWQmodh2BBA==
X-Received: by 2002:a17:902:f68b:b0:216:55a1:35a with SMTP id d9443c01a7336-21a83f9cbedmr425818135ad.30.1736963395489;
        Wed, 15 Jan 2025 09:49:55 -0800 (PST)
Received: from thinkpad ([120.60.139.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12ff3fsm84488855ad.79.2025.01.15.09.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:49:53 -0800 (PST)
Date: Wed, 15 Jan 2025 23:19:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Anand Moon <linux.amoon@gmail.com>, Niklas Cassel <cassel@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <20250115174948.yippqwr5mekb6o4d@thinkpad>
References: <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <5a3e8fda-f9e4-4c2f-847b-93f521b8313b@lunn.ch>
 <CANAwSgSUuEvJb2Vn58o0i7Soo3jGzM8EYHvDtUTPxRHekCpruA@mail.gmail.com>
 <c94570db-c0af-4d92-935c-5cc242356818@lunn.ch>
 <CANAwSgQ_gojVxvi_OyHTyTSdzRrno=Yymn0AdEXyTHTgDTyFcA@mail.gmail.com>
 <Z3vGXrUIII4ixNnF@ryzen>
 <b49e6147-32c6-4239-bdba-72f25ef04a9f@lunn.ch>
 <CANAwSgQqPREeFQisQZXqB52+w+j54Bwq4RMiHf3qUTXmnTxCAw@mail.gmail.com>
 <c08f3d69-1f3d-49a6-96ac-0c2f990f9a8d@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c08f3d69-1f3d-49a6-96ac-0c2f990f9a8d@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_094956_252727_F86C0516 
X-CRM114-Status: GOOD (  19.74  )
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

On Tue, Jan 07, 2025 at 02:13:34PM +0100, Andrew Lunn wrote:
> > I was just trying to understand the call trace for mdio bus which got
> > me confused.
> > 
> > [0] https://lore.kernel.org/all/Z3fKkTSFFcU9gQLg@ryzen/
> 
> There is nothing particularly unusual in there. We see PCI bus
> enumeration has found a device and bound a driver to it. The driver
> has instantiated an MDIO bus, which has scanned the MDIO bus and found
> a PHY. The phylib core then tried to load the kernel module needed to
> drive the PHY.
> 
> Just because it is a PCI device does not mean firmware has to control
> all the hardware. Linux has no problems controlling all this, and it
> saves reinventing the wheel in firmware, avoids firmware bugs, and
> allows new features to be added etc.
> 

Most of the time, it would be hard to define the properties of the PCI device's
internal bus in devicetree. For instance, the pinctrl/clock properties which
linux expects are to be connected to the host SoC, and not to the PCI device's
SoC (unless the whole device's SoC is defined).

Not saying that it is not possible but all, but very rare.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

