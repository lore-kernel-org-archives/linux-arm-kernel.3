Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1050CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ujd5qi4nwlP9wXVvUg5o3lKTuuQK4FVXJHYGoARDBmU=; b=3EBS6T3oRRngfgHM3CAbRiifzu
	oGXEM0PDv6k1QwD/b4p/F68YFhHM+z5BX5lrlQgPU+2EL24V1cQhCa4By2J097LQuIMW6POaK3ysr
	FHQFblCpiDNL6iP34PAJ53Z2ZDAgCYZD3yQzDm2pLAhiBeVM0PA836c24OHX/QBx6K9uMiMVdq0zv
	r3CXfsMuhiOPpZ+TPqOa09TliXnwT6L603v4lyq++8zszFumpXTZDeNoQcdb9RqwZcYJFwrWFHgYK
	DbT63tYz7LZz1z0ivGSAlE1hRyPOj/Rp6qybxgXHhRDTBhzHYHITuZ4x8EZm9hXtHfZs2h84gU0mT
	vLNGA/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChsl-0000000CGJq-2pbH;
	Fri, 02 Oct 2026 18:21:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChsf-0000000CGJ3-47bq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 18:21:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a166199820so438585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790965271; x=1791570071; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ujd5qi4nwlP9wXVvUg5o3lKTuuQK4FVXJHYGoARDBmU=;
        b=FjZetEb1zBIg7W+UBxZICLRMOJY1a4yrq5VokAYNRKNjA/qpVDCgJuITNAy/EbT9T0
         VVbEXuUaYfZaMfyWzsc9L6owfsJEGaOTkHkgZiUe8T0giiHRkP8Pkbs6FsJItInA9XF7
         yLwtKx5LRLTDRv4SXcCrTPn2SBJK1yEA+QBDzjb/TO4EP6L+NOJ32Jp/CbyXSBExkLkr
         TYvqxhrygK5GwcVxmtr5L8NSKzNnBTeyLWZZiTdX+tn61ftr0aDAM93yrwWV6pgHrWh+
         Dpq586lD2iBWnEVlDEzODXOI9IE/2SwivARYTwy4sNW7EXV0GBZLnDlF5vX+CELHBNSf
         uzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965271; x=1791570071;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ujd5qi4nwlP9wXVvUg5o3lKTuuQK4FVXJHYGoARDBmU=;
        b=lpO9iOzAgOs2PdvvEuTr82C52Em3H8hkNatop9HlPHOXUhSeyu6ZMZk52h3rq45Qp0
         omdH55HJ1mSoflMpxjW3vM32oaLRZ5ban9nVQaFA8eQtjtB0omKVKh2idoaR5cqHubtR
         ny4+VmppLjMbnNvzJw49reFFs4uXo0fcINKGl4mOKhQgrZqm6a6mupKdw120Fw6JYLBx
         +n8yNaWW4ula31M/ZUB2E9qwYfa7Pv7duAfPzscTBO1f4pZRo4d8M51cv74lGZ6KAMoI
         mdIolxYywJ7IR1fVCX2SspIFUO7a5pVwBrzkSPQxZ+x3jVuVp84/y1kMRooz9HH5f27r
         vvCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqNsn0F2jBnhJFRYI6vxiugTNtIy1YTCFCLc2AKBoWmqwc3/dQDSRV0i1a6QyeM7nqL95CmpHKsLizhmQHqL5S@lists.infradead.org
X-Gm-Message-State: AFuF++lzYVJAvmcTGKSQL9Ydi7k16CaKDvGxJi3b0xNddDK+MJAy9ymT
	ujZxSEWTN4CGy5im79NC6elejz9ULVUJs3EXkJLSiPo10MiUjl5ELUfx
X-Gm-Gg: AYBFou0gSb5bCVe6EZVOEqeIT0eo7pKO4BEq5BHHmTzg4i76kUEQu4r0NJdRuSRYBmq
	YA/v62Y8++LWWgJz5URMLPPUgCoNttcdwjxEHcZlZaE+O5hi1TnTM7JneZ/5A//wfjjCjCE666n
	qG3eSOOwDzZyjgVox5wGgAIEUN98yg2cxL7A5RdgM3gSaes25DLpOxnXaTlWtWJli8XZDe96uc3
	8NC4M34EmEIYJrslYiPXKlvt1+f0pMBxjtaUOTnBxUajEhSCaHkHkNqJl8cTkMHQwguJvrBbIdq
	43DULiCtRtpv70xEk4YRvD/36SR/Kd+IBdv0my5kNv9zW61pfY0yDQA12npv4gZ48Ktnwldta0p
	RmVyXwF2qzzDQPoZvUX6O1f/KB5JGcXuJhd8TC8z+s28EnaYJsYShU+7hGbj7zoImMfNo4hDcZe
	3u7yBn9DngyRDJZ66n1wypcKuhKAgncuy7ynBa42kMgjXy8RMtfuceLloXiYhgmII8JYPPdfCK9
	5bXF40yhLs=
X-Received: by 2002:a05:600c:4ca6:b0:49c:ff66:7d88 with SMTP id 5b1f17b1804b1-4a01eb24989mr74619405e9.7.1790965271047;
        Fri, 02 Oct 2026 11:21:11 -0700 (PDT)
Received: from strix.localnet ([197.250.100.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm7546193f8f.26.2026.10.02.11.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:21:10 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Date: Fri, 02 Oct 2026 21:20:59 +0300
Message-ID: <ZjjQUfHaR8iccs1M_cLsRA@gmail.com>
In-Reply-To: <ar_Jt4eIPy1-uq1-@redhat.com>
References: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com> <ar_Jt4eIPy1-uq1-@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartH9UaHpHZRbKrBREmICrngA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_112114_643736_3F0DDDEC 
X-CRM114-Status: GOOD (  11.58  )
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

--nextPartH9UaHpHZRbKrBREmICrngA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Date: Fri, 02 Oct 2026 21:20:59 +0300
Message-ID: <ZjjQUfHaR8iccs1M_cLsRA@gmail.com>
In-Reply-To: <ar_Jt4eIPy1-uq1-@redhat.com>
References: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com> <ar_Jt4eIPy1-uq1-@redhat.com>
MIME-Version: 1.0

Hi Brian,

Am Freitag, 2. Oktober 2026, 18:11:51 Ostafrikanische Zeit schrieb Brian 
Masney:

> The commits in the pull have the changelog in the commit message. For
> example:
> 
> https://gitlab.com/stefandoesinger/zx297520-kernel/-/commit/75e4151c9e157d84
> c8c6c365893ecf33d221bca5

Doh, right, a merge doesn't strip them like a git-am does. I'll keep that in 
mind for the next pull request.

> I went to the last series and cherry picked the relevant commits.

Thanks, that works for me. And yes, they were identical.

Cheers,
Stefan

--nextPartH9UaHpHZRbKrBREmICrngA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq/9gsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiISQQAJDoXziAeaDE07B/kRlD
TMRWOtATrwrG5lKmW7BtzBnVA5nz2up4jWpVJvyqkT07v38KHnFde0WG8OQDH1sV
/SilvR3Qd/kMoUUB9Ah1H70ka9PvTfewBn3GpOn7jOo4QPOaGgM1NI5QUuha8jpU
fzEtqAk97Doyl2ZEoGMkiMKygEnUu6IC/wUFjSf6n+apZbf+M3YA0zhvpVXRqsat
B2i+mBafNrqQNQBKzui5FZovbxChN86hnb23j8shDGTV3QGusiNB7F60Pz7rRXcY
1K7MMEjVdJj3pMyLgsmyOubtl3pFP3Gii1EioKU2FKSRTE311xXXBX2GHOEj4zUn
ja5Xb4TVYIJoolB7kEpU0B/k6KllVo5QS+3LAeV8oPZoVzzND9qZoANuS5vv+4Y9
FJ7OGYUDAN+fCxPma50hscRsAyxAmvMjjykL3pZu8aL7jhKjpzZKsBs/KBxZOCqg
lNjrVcwhq9NGMyxnxPXCsiNEbcrhZo9IjVwADpTpLmdUczHYNhp7wLkyg94HFbaY
3ertTJlEYbbYADBf9UnwvY0TBdH2H9kX/kBfu9Ko6CRngMt8jBSL0XIwMf3XHKiO
znmTjBITCE5XsqHPu0XIXey3hHQGIyC33egqIdv7yXjTZy70XHEp95xiLbE3dJ4H
4W2k/yhZQCNjiKxeiIWywcJH
=0hJV
-----END PGP SIGNATURE-----

--nextPartH9UaHpHZRbKrBREmICrngA--




