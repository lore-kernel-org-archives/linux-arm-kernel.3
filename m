Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53gg/aCTFTibjY5aJ4alNpQJDsk/0FoKqcakSxNP730=; b=pLgA5uiUIoZuBF2Kv8/nJMlX1j
	dKm0JR9sZQ9NENY4GQM3bab38fPTJDwPbj52sgaxRBdoW+dbpoDDo2RO5q2M1Qs5u7aCa2hZSMQbF
	Kf/1eDf6Jw1Iu3h0NZqx+c6ZD3jsGa/hby/VtEX92uXeOHY3h+ISfrmoXU10YADrq7jve8KqGWtXK
	MhQQyq+kkWTw4ieZBUNXzw3eXUgAM9XC/mHxB3MDvpgReDb8B+Pygnw/QA9Y408EOyQFXG2ci9083
	TkdBzphTCig3flWUYkX5h0GZ8cupqpjNEJ9EpXR9w7mNFeum2osKC+0nL0oUAGt2ueMNtA2R73FcE
	tahUYlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZ2p-0000000EVVv-3YST;
	Fri, 07 Mar 2025 14:51:23 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZ1C-0000000EVJ3-32ng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 14:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741358922; x=1741963722; i=markus.elfring@web.de;
	bh=53gg/aCTFTibjY5aJ4alNpQJDsk/0FoKqcakSxNP730=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Rk2JI14N4ARXCHpuTNyNOcInGRlDkRyGaOnvc0XIXeYUutcybCjAHABLG1wnNfQL
	 E0OC5UbS4qsIGNhktZhmXoeEx+Rj72xBVVV5biYD7UGcnPWwGnbEy+cIEpPiwEY8Q
	 Xodz7LO2kOD6E581tYK5/diCEoHmiUPXXACz+eniUXpob/rHZRB6LSDtrR4em4otj
	 DHvyto3q+jXv/haoOKN4VlAgedztXJx3HGpJK3IXxDnYbd0yiQHutog9A9GfqHObn
	 X9w/r421MIcII9vZKaJkV5o9w9NykVGYUR174njtFLopu5pgjOxmwCNUMkaRt8n1d
	 mcWxNyu2oF7hNonkgA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.70]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzTLI-1t4OGg00aO-00rs3h; Fri, 07
 Mar 2025 15:48:42 +0100
Message-ID: <c29a5d6e-335b-463e-a318-e8d78d176a9f@web.de>
Date: Fri, 7 Mar 2025 15:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Simona Vetter <simona@ffwll.ch>
References: <20250306042720.2296-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm/exynos/vidi: Remove redundant error handling in
 vidi_get_modes()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250306042720.2296-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EcZzEqOUckJHTaTmMgt0SzYVfd5Np76gwmwaGPdRegKbmAQG2ie
 RCevNQmV/4Ln5FLn/62gjIXAXTwQiqbh+/CATnHMYczi6MEkvoN2BjaOvrQfw+HYKHhR5Bx
 mzIvsJgE1sKOnRViNKz2N+UpbCZJft0aRieW7CKidbc7mLkcQbyX+KULpqBHO9Kegi+W8x5
 R1QalZUFSCke95V9fRkHg==
UI-OutboundReport: notjunk:1;M01:P0:BhmL7JB8mZw=;0Gs9w1jIrIJFlQZ4oQBwgNG9PdQ
 nXplFJ+a+QA1RHvsThhDSdcjEM6cRz//u9FqvZxcsmEBbR773A8sqENDuyC31AAE+qnnv+dM1
 iHBdO9C+ZSifqcBqSc2q5HZoTkkvWvGup0113DCSPJfZPERdC3223HQkp+iG0GOLMILqGPKcw
 niOa21dCv/jZS3BW/bAfHnpXtsKxgfUKScVf/seSgmtGPRoEk25fzMUrGjAEFStd9rXnHK6rc
 HCNpN+VULvHVxPbYV2GqqAJENiWcPEOiaSb+LdZzppnTd6/8HW9Gg7PIZFLFWcPAvz2hp2JhI
 xnV9t/wmBN8zqmCUkvu1WqOaM56US9q6VhRJubmvtugstNNrH/qUP8JVRQvmASuFzjsdQ8djo
 gdvQjyB11O/cVHQKIKOt8kPvEB0bRdvGRdZP1C2DIln6PxsQOVsPhd9gkLu5lL/Grds458w7b
 KYSUYAwfbNAgXSGKh7/NE9DTLh/50oMB/JIReQM9UDyyQ62IxnSuF4zkxqYLH8JzjByh9blAR
 l/sWdgXXKczn48QXbrGJiN2orUU8kwFaEWXW5ojieXNgY8QaYRSf18bigyo+4a75sF8S6ntua
 fPAk+gFh2I0XTgqkKcARKzBvsby9t7IYc9UuVW2rrmOOVPaUHaIiN3fq3LgEj65+iWO3pGGEN
 ZgaAgZoHthKpXVnNG0hHAde92foYQV1SQhViNw0sjD3OyyYqTSNau5sjNuOJptKEroDWWzHVw
 CAVxO0IsEnMN2aRwDSNQ8QO/fd2qp2RkE4/YC//NzSNh+N8eX+NBNBK2vb2qfoC34OzZCoE4O
 /o4Xy3iPiQ51JAb8lVeadSMR7aPbro9HOWvHzbPy/tHkVEd826PFhyTTO1GLNLXchFNkURLMi
 RE1lxllCOUI+2xgyJxQn0grSkFgWCfZ7lJ6H2sf/dOGUjb1gzmUmPdhnn02h5z5RDIC3yLW+a
 L07FuFRq0El4llj695N14l2b8OpLs1fKpO1qh2sThOXovc5dyl3pxcXcjQYTZwu/9sLtS1P2D
 yl2v+e8F3S7npQJXYV5aDzAwEJ5wnCtVdcjDMXJl4uItgWrmvumM3DwxU8jq8PO4Eln4DdjTU
 WLsSDnYoCewDHiu6WutEun9F6faMuYA+boXsa8ZMMJNAQMcdSe/Xy7eWyOLIZrRIYRDaZ+FSo
 VGPuvzCbdvH74SnrGbHKU/8gdPfrhy4wc7aYCllaOKC5BfEguPh9v085UDotW1Knlx5qMUa6Q
 ZL7cESsZmIWCdP9uPrTX9DCROhJ7SPXS31VSNGoOlD3NOkJ+4tyBj/uykw8/0rJrGISorqFzj
 wHir6t6hzukRwaNVGNeAUqn+shSuKB+km2H1t+Lp+gsNm2aN6bkSwWv9I5sY1Ru2R/vW39YSu
 ZQDHxb2D8DrJvQfi+iXsotjngUP4ea81CQRft+Aw2iBfHBaQE4LGZ8KxmSAMFBFIHeoeb8eBr
 KFtS6Kg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_064943_046050_B5C655A4 
X-CRM114-Status: UNSURE (   7.02  )
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

=E2=80=A6
> drm_edid_alloc() fails, the function will immediately return 0,
=E2=80=A6

                   failed?


=E2=80=A6
> the event of failure in these two functions, it is still necessary
> to call the subsequent drm_edid_connector_update() function with
=E2=80=A6

You may occasionally put more than 66 characters into text lines
of such a change description.


>                                    =E2=80=A6 To maintain the integrity o=
f
> the operation, redundant error handling needs to be removed.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14-rc5#n145

Regards,
Markus

