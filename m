Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343D4C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgoLBoSdsmfmuqpXM5gofGXTPEUeyBBSV93lb6OMC7Y=; b=15HrLtgRI7yEk4D6xH69yCFVXk
	mTfh85qMlGxNw7XMiTyQ6gOOyySrobL+gAtqLf4DYKuEw5bpPeh6GX8kaHbR9DzCL9CO0ZVv+DOJK
	7Rb/ZhtxepYlBTGRyZY+kBajHqItZAzd4hjIIbe9eACA/aGp/MopEjlBSih0OZndhdr4At5dwLKlV
	DAK0mUWPZ+m8l2nco7LvXdAxQkENlaa1WR94X5gZZWpKCFFAZQVL6DXie/DeSpoXTXOuUMgcSq3fG
	3QJ/9NgX9XcLbCWGylJkEVkRcCnUWbaHVAp8MVasCNr5bFDvfTBrv3zYs5LIU1dGIu97jCSg7cTIZ
	wBczqUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBaI-00000007Irh-2ADj;
	Wed, 12 Feb 2025 12:11:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiArn-00000007ABP-3XVI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:25:20 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f6d264221so51754225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739359519; x=1739964319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgoLBoSdsmfmuqpXM5gofGXTPEUeyBBSV93lb6OMC7Y=;
        b=jtHvPKC/4yr01rxA1Y5jCLwKvZMHTr6WWWyk86Vqgzs9kQnCQWAlEjMIgm9N+m5GTZ
         uLEZAnCKBQ8EgO+zN19WK5GgFxGPZloecDY32yD7LWhhNLa3J5rmHEodIsh3EHdlEtCd
         awb6WOhoz2azdt/nETQHy0taSLhnu1DAZu+hjabiY2y2rCUyknlJPjTJJsKmfEntQByC
         EF80ha8/esM5kavz6KCUbjjl9n+ax9yqo0edF3ixHDFlKB5bAQNMcdPYqA6ad+rcPeiy
         HKecR9LdKIxrMmWFprFw4cTkbfzMQt2YigJYomgeuBEznGCS38h87SRkMFXrWczUO7TT
         psHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359519; x=1739964319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgoLBoSdsmfmuqpXM5gofGXTPEUeyBBSV93lb6OMC7Y=;
        b=lZDAijEfXmkeM57dwUjC0DnOMjQsEaxbdxqTOmOq/7YCk3ze4O1S9XQB7xmkMDZOMD
         H3p/kM+gYyfXLz7RW7rso2ootQGlNnMVQ8DIlsK9Gh1oIM7eWHOm4fgOI7/9ixeiax8U
         JP5YKWewh+v+eUPVKjbQBVWpc4yKGmbicaypqqOhPzpfJTzt275FA6Sd7Wv0mfjQ/LGs
         JcjcIBrlUfcwZAVmJ2pRxR1KGdtNRcnyhGhbePWnG8p5OeCXz8Gsf79k4m0nF1cSJvWy
         /rwqQ9fEh4lJYtD8S6kiETJYL0D8PZ2lshQd3Da2VJDuJ8W1biP+gpq4zdTE1XhJ+ngb
         p8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVtSIUaQO6uMa4dNRu5lui+hh94XdkVpAKgK2GUj0NH3SjCHwBEDU1NBM2qalF8OqZpsKx40fNIEMQB5LzS4GYm@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ9JcnGyfnnXrrKvCIMLZvyHEAzDbdAHROXnOqSu1XxCmYcJ/i
	rvqH11HFWml7TRVZ8h5pu6c7AT3iB5yYMoFx+xrrMsaS/0XQw2Xl
X-Gm-Gg: ASbGnct+Wip/VNrr8ettmSlDd+t2NdgsEIADTgI+/HSf7omE/PJ8pAfMdikHJEolt0r
	i7P/3NVpQk0Xwamc/qDwbAsmuravX/ol/tNcbFc564akiriK2UhisZQpaciB53DGnRta+kGo/V6
	NQQSU1XF+cchvWg4iq/MtrPDq/p2T3X3TuRa0wyY73cJP9sEpbifXKl4RABDtO+YrmKJQXZ/vaS
	qIVFM1/aX8QO8OK/uHkSAL7rXGrYPw94Vp/CjLCn7udFKJUBS0ch1mznGDLMxPXkIlZQQcusItZ
	271+LazeLqNKhvs=
X-Google-Smtp-Source: AGHT+IGSXAu22CD7MFAjaX8B91j1oDJlyn+2ztCU9HVQMzNMzKgxATJmndOJK7sQ6+CxJ94W1Ao6xg==
X-Received: by 2002:a05:6a21:3987:b0:1d9:6c9c:75ea with SMTP id adf61e73a8af0-1ee5c732ce4mr4676523637.5.1739359518743;
        Wed, 12 Feb 2025 03:25:18 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308cef0957sm5468012b3a.5.2025.02.12.03.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:25:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EF2E541F5559; Wed, 12 Feb 2025 18:25:15 +0700 (WIB)
Date: Wed, 12 Feb 2025 18:25:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andreas Noever <andreas.noever@gmail.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Dumazet <edumazet@google.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Young <sean@mess.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	James Morse <james.morse@arm.com>,
	"Nysal Jan K.A" <nysal@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, workflows@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] Extend automarkup support for ABI symbols
Message-ID: <Z6yFG_NntQfkwYli@archie.me>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/8yu6IEGS0ve/RxO"
Content-Disposition: inline
In-Reply-To: <cover.1739254867.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_032519_883239_4A95A32F 
X-CRM114-Status: GOOD (  12.78  )
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


--/8yu6IEGS0ve/RxO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 07:22:54AM +0100, Mauro Carvalho Chehab wrote:
> Now that ABI creates a python dictionary, use automarkup to create cross
> references for ABI symbols as well.=20

I get three new warnings:

WARNING: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defin=
ed 2 times: /home/bagas/repo/linux-kernel/Documentation/ABI/stable/sysfs-de=
vices-system-cpu:27; /home/bagas/repo/linux-kernel/Documentation/ABI/testin=
g/sysfs-devices-system-cpu:70
WARNING: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: /ho=
me/bagas/repo/linux-kernel/Documentation/ABI/stable/sysfs-devices-system-cp=
u:89; /home/bagas/repo/linux-kernel/Documentation/ABI/testing/sysfs-devices=
-system-cpu:70
WARNING: Documentation/ABI/testing/sysfs-class-cxl not found

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/8yu6IEGS0ve/RxO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6yFGwAKCRD2uYlJVVFO
o8lhAQCQ4fRHrhmP52Ie1GWpvmnThVAVajYhveINLTbggfy+8AEAmFJjGR9fv2Ph
AlybXGGYbN21qaIJUDcQ8kIXnvwi2Q0=
=z6el
-----END PGP SIGNATURE-----

--/8yu6IEGS0ve/RxO--

