Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E77C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aS26mjbyN4abFalJdzaoStx6yXU3U8r5tdNKBbcsZHU=; b=BJKEJNqVXkidMsVb87C/JEdiTU
	q3bm3vBuj9hmF7KSPRsu/hz3OCAohpBD29EcxWArI7dZxRWPjXBx7UpqbU+YtzRJXJH238tsLXLKO
	GuleOwMAyRtQx3OnQHxajjYIlFcO5GQUH13QmHWNMOMS4GIw4BxH33om3mVVJBEq0cinttVB5Mpl2
	ZkcnYyYOHTYdTG5lRuBNciMUWRTuCT6OEdopXlkHGHALYy4N6OK5jV72mMVjPPT1p2mPpooW5sHJF
	PAN3SuKySKpGppckRN3bFsCHAeGJNGkNFc6C+teDTLZ2rg33vWqpHJBbV40t9GpkGHTfTo+ywLo4g
	MA3mO5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twPBn-00000001WOF-2AOI;
	Sun, 23 Mar 2025 17:32:47 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twPA6-00000001WB8-23Bg;
	Sun, 23 Mar 2025 17:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742751057; x=1743355857; i=markus.elfring@web.de;
	bh=aS26mjbyN4abFalJdzaoStx6yXU3U8r5tdNKBbcsZHU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=euWeTzGb1rN8KKZiRijlg7gIUkM7JDUBfjL1gr+b0UK6l43xtJPFUz5CA95xrbCS
	 MIe3kTPEEi81izfL1fEKwQgl6WArlH+zRuqSABOKbHDWSDB6lnT7+78msDp52/rLW
	 iBjLCyZIdPSjolVmPV6siFilCy+spFpHYLmES7RJZPUE0vZfrELG47MweIOpyycCt
	 GX9ELDgPqjlYRTpZoYO+ChKDY3UIUXUHwcq1F6YExWJsK7jLMYKkeTVK53y+Q0BJ7
	 RHVNvNjXfVeo3IHHbnWIIv3Fj10sXgDYm+vbWYcL8EV/Y6Xi8c9vh8LLVKG8CFln0
	 Q5W8brIWphi+HhXLyg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.71]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQxo5-1tl4ju0s23-00NkmL; Sun, 23
 Mar 2025 18:30:57 +0100
Message-ID: <6a45eb0a-01e2-4316-bbee-93bdd490cfb5@web.de>
Date: Sun, 23 Mar 2025 18:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <bo.jiao@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, Jonas Gorski <jonas.gorski@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
References: <20250322230137.28164-1-qasdev00@gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250322230137.28164-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mGNn0js7md32cTCJEgqZPPy4hyHljtu/hoMlFhXvzLekJuVU0Tn
 ubdLUleIlTmQ7FNQCSSLtPk3mKbVE1DEfbxSLB79BnUzj0ur97GHBQwF9EHV/i7KatTE6dR
 eTMGxaSKsHq6n6QcuxIs0sng4OWxo+1OkswkNWIjZaGXDAReJwO99DSIX357yW9zouy1SrU
 BoE2zwzo8r3hXOcR1nTOw==
UI-OutboundReport: notjunk:1;M01:P0:1mKSqeyZi18=;W19U/1M1dA8MGB8usvwUxEXkLrA
 nX9et2qPU3TAVk6+9MNSRQc7tbID6fWCi0D4PfbYdhhiIQ1oSZEebgUpwfjDM4PR93C5jJhEP
 opfXC85UGKH/Io5S82p8EF5KmzLv3i+o3ArlcyvLHaDClTwhKowH0CyUOAJvS/skGk9wGBvNW
 Apt8Qi8092gawnDgyx7+fWk+Sn659QJhBxdTFeNs956DBuJub14R05/8lPYyyn7XieEhHvJ9Q
 D7q05Bj+5ELl6touPRVUeUZ7dZbAJfh+CoHpgIr34/1J1XHwhrRC2dW7qvOvn1oUeKkP5uacD
 id5Ry9xhNomJmnYViGiHAZS+6psqWBc1TisEhNkYPBK1ggSARrjA/E0IEv2La7irHVolti+im
 Ju0Bv0TaNTuqUMKLDXaMVgpFqZjh+v5LmiS963ludUk10U9iny/76RWKFi62nmb0MomEA/Fdk
 A2S9ZDalutNaPAPllTItGKLaCcHt4noqFjsk2oUllAUsBh1p7Vf1SrDtBBSLIdLHhYSMrTOMJ
 tPtGTW+4YuFCAkG3CtXnNycKYzjANaEsapwMwZJrg7MKHCsZNctZnywCRdURarhMV32rDkwmj
 6leNKcFSfy8uNy4zhkHFeLEKp585UpENSzgWC9iWTh4BidpS7/O0+bHlWWjljuLWaJ/v9j6ba
 E1i/7C5Mxxajxa+A3U1veEDXrfhjYjP72q4NX17/0D4PQx+m6uM2evxyMEKn7Z1FqgpvFqbVP
 EOMOgVSSIBdGfkaHLrFqd2Z12XaRlhlNMDrTQiN7+d4FEJKoeL3y+wfgKcpQl5GRurIuCxzp3
 GQHNyWiUynnWCFVBeQSlrJqDNZIWRHkFAEf6Td5ZLb0dHJ3Rk3D1F+GfxWX2Odf6kGYpefxB5
 /KxjvhkMxmnnG1JOPQ+oTMP8lbGtELlxogzvDh+aRuQvSJFA8gi4Qn823ts8hKiWzwGlL0ofs
 et/urC/Dh8Q1J46iFNE1I+M8apiX1DV1VFjpoN+MnhF/7YTFssXLtZdHIzfMJeGMHAZ6A+sJj
 HNXVW/krAUfhEuFvrtbMk8ruB2xPFYPqSZJ8nckIBVmJ0kNv73Y/qwdHTCDjXGGiGejd0lAVb
 Q0Ii60fhYvLfYY4JIGgatWLaZW9wsJfs2892vPFai1FUffWGi4ydcjy1PtNG+fHJ08sSmKrAr
 o+H/z5LnthVDCtelaevV8Vhm1P0KlM6bvXBLn5NkzB0h+HALG/0Bh/CMHTk0lnDw7UacTN+Xz
 0GrP/uXKvuV9SpgEr+fXjbKHB7i0JOPS/r1hDdOTGKL3YOirQvHVnLDGIRow7u82hYAvtHqDk
 OBnpau6DdgRyjn6h62bN6ZqhQCwC3O52ZgIlNJUUnceydse1LE0LO0wjqOMRc1t05NO6Ggkzo
 ofdzDtHsPegqzSFjPOaScufqL80/wB7fKk9zI7DdO9H91BRuGGEzFtn1M06wAR1sgpAnr/c+e
 PwnO2hzsS/4PaqwdgPbsmJDCJixtXFVD+na45TtlnprpYIOC+NdXl5v8LKgLBi1jWiEZc2A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_103102_925419_71F51C57 
X-CRM114-Status: UNSURE (   8.29  )
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
> or link_sta_dereference_protected() fail the code jumps to
> the error_unlink label and returns ret which is uninitialised.
=E2=80=A6

* Would you like to avoid typos in such a change description?

* Can any background information become more relevant for the usage of
  source code analysis tools?

* Can the summary phrase be improved also another bit?


=E2=80=A6
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, s=
truct ieee80211_vif *vif,
>  			continue;
>
>  		link_conf =3D link_conf_dereference_protected(vif, link_id);
> -		if (!link_conf)
> +		if (!link_conf) {
> +			err =3D -EINVAL;
>  			goto error_unlink;
> +		}
>
>  		link =3D mt7996_vif_link(dev, vif, link_id);
> -		if (!link)
> +		if (!link) {
> +			err =3D -EINVAL;
>  			goto error_unlink;
> +		}
=E2=80=A6

Can software development interests evolve in ways which might make the avo=
idance
of duplicate source code more feasible also for affected error/exception h=
andling?

Regards,
Markus

