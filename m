Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1429CC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeBzjWJScp+RNNNGOapKd9xq3KtEcx9rH9mfasdLTeE=; b=cw+NF5quILSQKuPiMaulHNYUou
	VgxjF5W39ougg4jZwustn6IpNLUW285p/5Y5DVERLIbKXwytqw6gm2V50b8XX/B/y32pyv8ncwoq+
	sBY/fkP3btMdaCvqNMIva2aTC4+ht4WlXnIvL9fbGmy3eIm8+9QU38shr98Cw3uOnbMPhv8D1VKNB
	03AjNv6BKSReKhrhQ78HGBvbfC+/aNb0tHZLYsuNE4JhGdg16CbDkaw54woya7bfTRIS44WKOvHxI
	ttusDrq6g9CHxxuX9moHXK5CV28XWbt+ax9ixvuqIK4jNg9YUPF0wQIIJX/aU0tA+gVJoCrvCSEvC
	NV7WGpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvrs-00000001JNN-3Ppc;
	Tue, 25 Aug 2026 18:27:28 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvrl-00000001JJY-01z8;
	Tue, 25 Aug 2026 18:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787682430; x=1788287230; i=markus.elfring@web.de;
	bh=YeBzjWJScp+RNNNGOapKd9xq3KtEcx9rH9mfasdLTeE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KDYVGl1aL/4bS1aSO2MQg0fePOPHi30LiEIsbodLSz6UsL6A6karegFCTsYni9qB
	 4/HlWPDnJEdA9xTmYjM5+bjCbOsGTrfXDEylwC9NXqzcqWjOzfGVJeDGc3MGOnain
	 /3ThjhDLKUqHpOv4/TBnQWGFpsLkGTrtAkjziwYFbP9PbsiYFae923TNCxxZDGz8q
	 VcHLwNNils+Rv7XbSqi2OASa7IO013SAZNSluT9JVGMw5j7XajwhBTMEo0g6nTJwH
	 TfSxXIBovTwCDId+BrLauJIVSOjUp28aDQsGxmHqR6pFWBNtQynq4jzP40owVTQhF
	 ydPXRd6gKA5kz9oslw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCXVZ-1x82X83n1v-00DTCa; Tue, 25
 Aug 2026 20:27:09 +0200
Message-ID: <8ddf9e4e-971f-4a82-8686-10d9783d4798@web.de>
Date: Tue, 25 Aug 2026 20:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mailbox: mtk-cmdq: fix runtime PM usage counter leak
 in cmdq_mbox_flush()
To: Manush Prajwal <manushprajwal555@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <6a8dd21e.b12cec6a.f9ff0.b637@mx.google.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <6a8dd21e.b12cec6a.f9ff0.b637@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:24a7rTHZpB23AHhDSLqa3g9H+oCqbOlrN0sRE4i6dGxk4XVbObJ
 nHlNSwYBu1sYcfh+lEhydzkeizp2ZDK/Owiea1KLzZ2Tk/PPuHl0hoCNSHjYq9b4Pu6O7p7
 QDR0yw65QtcCDKASLFenlF5tfpF/Uy+SavBHNbyly5S6E0IiUk2DfEGezm8GQR0wTk1yRiY
 +AC+Cwmu89D1AsDEah0+Q==
UI-OutboundReport: notjunk:1;M01:P0:6fuvFCfVzWc=;12z+ukJjtKyLCcurjUawLO3kiTD Bj8vfkn6JK3AahDaxGDu8q96rDP8hc/xlmzv2EVFM3IIyUxy8/k4p2GGsA8klS4/QlwtXMn91 TXlAOUAqBwe6cG1Pwew/PDj/3JILGQ/ZqrqztjdBhbwvjfJ7XlXSQeoyBAkknSWYSef/LNKyY NkhriL7ohiZQ2jKj2Drn163g2FxTQRt0cKQj+Ivyp8AG4Dh4MZwzKkrHVYLKR0Rpq0KO28sDb 0ND+6wvxk77KRkFDQ3EDCs8flIpuhz7JW0kFOj9H7dTNnzgbt1/c+EY0mSGE7HEYUHFN8kk8j oObcxOzd69xfyz/NNqti67puURsn/jZg8bMcVXw424G0s1F9Bt1dKu0Klt64EdSAJ3KSvgIf1 DjmUEl9oObuFj04SsTCPC+V8WdXa6oOTxi2jbVUA1GOgT4HKwKYwA7bGj3j06FfGuohv2co6P uoQ5WTKqKMv42eu0MV1bwXJSyIJD8fXFTSTxMzklqW5Ad6cNttrYievQ89aqga9KxaWyIBs8Y j5ZHUek9An8peW7YeQiwDLhVyYQakkajr2OabKmvF3EeEaMzE7lR1R64opzfPuMQl1PtWC4Q+ X0rOiPc/pRtH3J81cDG37kU/6VDsVtAx+TC3zRvS7uO2JuZoJQwZw1ECYUkj/ZjuXgLfD03jZ aE07hu7RNDVBOQQHbIVZhguTUVxY4lxpCe8b2U4/ffsHqjH1YfRZ2/APgfXafS/0S34BW4Wda eHmCrdhFP2SHurHhY3Gk0axDfdU3IMH7rEk2DHJ8SdKk0Zier2PpS235WG0WlHVea1GxEq7l9 gMUiZACnlqXSrAF24iO9xNKE7Gl5oIUOoah3cYf4bgqmDoPMzZ5WiAYNkL1Mzw/zdEkENtCYR J3u5z1ad9Dl4eXONY4e2vAPad5n6g7vqnMcACYVTxUdI0dVg4JfO/MdCAuQOVB5N8yaerSxnA ELC8imdzttuGOvOWB1B53QVoQ1fvPkFYuWvWCWaJaIGJNtom5oRStECX4bj67Kncmnc/EzC58 mtsRfJ32HFQ0b0m2YiBp/UY7PC5/THk3tMSwkKIEK9k3pDpcc/YAZACwSL3YHEK/IQG/eQ33a 3uRz0+IgSFL09ybpbPdz0+W81Ltk0xJuTnaPWn9iK5vu1F0+bwh+5w66TNxKCBuRhudOmFhda IIrylA/bmq6qx50Axe6VdBGE4kNjR19Ck3hj1nmfBOAG/IdAs/O4Pol9meJIqx7zQz4D71toF nPXXfMNwtyUeOdjaGeDWmorgpPzp3s28GpYAO2g6QbL/dRrl/tp2YAoBJWlFNIMF7gwkieKoe AB16jU2MdrSRrQAc0dMGJ9apjF6ok//yH5FcQsEpyAzwWADtHufr9W1r24QdY2+o6AhK0MhMx bHEqFSwUvAUyLSTjxh2thJ1MVZoU2bIQpGur74Kw/5kQtC+8NqttJWDgOKL7pSu960kvlDsEf /THI96fYVps9g0b0BWnkAa3DCMjAEAhlGQmEcDlPRh6NEhK1GLYBBtNOCj4WRWvZJlxHbHKB0 B/PUx7Aa5RkM+/xT/FGIYtszf4NJe+mmM8ASCSJAeMAlmSpCn+vH1C9ymDyUFSnPhBoWuvHrH 79W4qwIgP7NBLKt5zK2aVbCR/1zyzwMa+ZiGaHIoU2nMdKE4egCnqgfoY1fl9O10m4n5ZnVls MhXuP3M1RIaYbmi9AvVXGb+Au5me4YsRUAfak+g1a80HrWoDt4O33HwiZ7FeZfcaJerPqm/Eh 0mpdjZClk3TOY++23rrzSElCDLPx960DZU1ZE82T1LKIDyJY1Z80gl6LhxL516qqiGWI4slBf qu+dcy693Iy17pQSWFgqPrbgm+DKgFmk/2K1b4sgiasqfrNVVtafMtdjUQhu9xUjMIBrVE8gQ UtnzpfX7xGOCMb5aR+Xttpdxr/AYYig3dWY/JIXGKqRwGzNbD4UDqKP1pmNMfj1opCAIL66eS +RYRcueV4Go4/Sktz8xCLqE+/IuNeF6oKX0BgD8t1xESDe5oCM0N5eOhDFo+LN6zYFV2bUTxF RbsH26lFaBsBFK+5MxfCEAgX3/GnwvgAuhSNxyEXkYj7ZVjYwbSo8DicmUt27/jETGiImvjmN /fvVqEAxR7i4rQpwpP3E/9STw3rOMOAub6tE0t94sof/O2To11ahyo2s92K2ZUY+OHG4bUiV7 Csqr7gb9mukUcynv0xAcygylIMEsKRv4fwpRU6qUER5vMFWffBsvBOkP0OrWXWFNltrDvkiA2 3QMgbB+Q6p8RBsJuiN3ReSwoO18AJaDidY4ZY2RWjth1cie6yaq2SyOMySp7nxPt+4MWFGrOs OBF6ZB1cDhx7cBEMwJZStt1+QYUQtmhkt3Wk5lZNx9n8AuCzdNQtocIGTXoz27SFa9vuNekTk KKdii+FHH78KRuQv4jXUSSeEWx4VMuuKeNyIdVkQSe+LECP0uixweJwqHMD4MVk8oVflUQ3Hp 32pEJFigDKcHsC5yvb2iQI7r6xKey7agRssCvpIZwqLbj0y814tdcUBSJ/B1vAhO5C6BH2Fao Z/UgwSB4uSOD05kAFABOWWidHcAJKorjNJ2Sfdxl366DE3M0JqT1V4smnpXIH7Yiy6iDeW730 +xAqjyLXy4tmPuj3SViToN4aP8HnLXHy0RFOsmTgkILU3tvBF0aiEjUGQ2vD7Kgtw9keSveQM a/4UKNANkibm/LYuLYad7+WNo0nRP0iXctZcvu0GfGkCktlXCYmVOZ6GhzGYMksoa5X4jDQVh gDFuaxS+94mYQLKKoVqBW5BFSUKVpZOyZA26MvSM0tFhj5S/nrWXTT29hxCC79BlgpjmYi99O u9a1ZFJCSlR74T48V+08LRNkeBehGarSP3zHHu7PiL+Tlqzc64AX+Toiz39YE+7/9Q6Fs/l2a 4RfrCJNO9auRIxcBzRz98/30QeN+FkMyXUuNhrY2D6uwxuUiDKPZH9nKOfylNH2KOO/5OGIOk eIQSfBltQeKzwfwhGzbjR+KgPAsdxAKJ0lI+bfmOgSLdhO5kdTDs6m4Dz4YpUJ4dEqRErZkER /sDJVSxMNzU3lcdDtx86SGMV/ujv3wRcH6Thwbfx73Ktr61i4WSOgSGlU7LgnAjGvjj+2wEMQ kt8XpZ6BTgpPeUTDZrMZgN7SD+wrYh/LSMzHQwt6AaEoy4Swez2FnJ2+/pVcYdRnc/pYU0aja x/aMxe22rJbHDu95SltL9KWGF8gId1UZfzA+3zsPZvKSjs6MVc063fkatE/T1Rttmcj+v5SSV e8bcjvT6wpfuZKKX/YCstvZKgEY8HPiSU9Msqegycx3Ifmfgj2WTUuiF/fsYYBmiokJ+V/UXf Te6asuYSkXe86nyfWkhtHtVc4iStYCys2ZBU8PT6oNzRh6yGrQcm8JGB4QzS2jhWjIWfPIOJw 7z5kAe3JV2hI77hqRrz82is3WOsigg17pcL3nY2Wy/f9+2FifpMN+qPbqUGn7w6tc2va56Xkb YhHAAOgmPm3UWdJNSc+UoWs7tsGFVAg2RrUofbEgbjm3cxjrKZWiGRxq815HfuEGd+23WkbOm xuq9lMvvls6ap02H/cwm4hXS0qEBRn1MFzMXOs7M33ZpqgJVoOH8dWZUQshRahhRTpHydX/7d fhKiEAh2h+h8Znnuocb8/XkJKyIIFd4Jj+0o5P4Z6YTOjY/t9aqT4RKV5f1nGaChZkVySr735 l9eLOU9ocWkGwa0ZLHSezHZLU1qJ2aRRpvMOv0NJZy+VdBJdFtm4j7PVI/ixBxBUx06kB4P2f 8WSzlh5PIAF7NucYoYwlDhJEyIW08Ny8kBMqLoj8xg0Ss3Xbw5VznT8D6iFGKrqLUAuV/x5TD YVPru84M7LX360NscVw18lwT7s6IJErV2M/9rUqDePQCh+YBgoFgZ+i4eYmJ+nUbat0kZtTAf
 JCgn9HCMA8CzMQ6/wS86XYbEUi/OY4H8eijxSBaCF2NF/Ki95WwZ1bEmDea8Y/nP250nPSDZM jZZshee36FrWupZw92wxUxANQVub4Pc24HfSTx81GRYK1jM3QRey6JxTNXFfbyxVd3Uz39Mb7 29JfRCiu5dInPG3VV2uML9it0VDZue3k1P5lawV4hcybR6DKkywaOfU1Ga8wPyfFRNXPGMAuf e/jc5lCkY9tddj9oxETWfzG8A7xWirUcXtMPCnSYpyw8KrQy9D2xlm0WrCLN+WkRWFyNsqZkz mBiFkVhoDcmlbWLH0Vv9idYt9lpoHpKmscEqEDev3LZqPnpfro72ShtAwVlgtS85azBua1LyU PqVSkARa5QXj+hMkXp7pMBiSJ0pMszO30hqmtvbMRBElUrr0AvQimjp6MGPW0UAThCEwPelf5 XNrVTMOhoGX66jcV9nJ0zHOSDOxs+Ln6qeK5fOhUQR6i0+n5YOiJCZWCKngZ99TESbf1GdwMA QH9rf2oct5bmogpCs9Zb3yjAcavxs+zJoAJFJDAcGoly3GK2spaNz9QFCsiW1XiRXInuFGNnI 7JScfMQOUF6d5g1eJVuKqv1qf3/SnIh8tnsAuE4egzEd0dQfaxyelxeDp8z5JIvjIVquEZJZV L1cDcVItSEScw7WP/SfPZ6Y9RRYebL6G/J9SP5h5Vn1tZGPDuxXM9h7yJMRaugDhyIMKbuxRV pN2dISlorDdz+q84DqRwF62yJvVSzIB0TIn4JpNmO9a2LRwny3CPPFQwXd9YNYD+06UnkiOkG NElGGz2Lgz1mj5f2dTioftOuFcYOUnChzjgJmxsxj9p5XzAWIltnIPcDd95oZvN6DCNlA1v/f TU02BUtOZcyJgzLtx+cHh8/DyAOXzfByPt9PfqBLyXiDRERXS7id2XT4lFtaPzQfD5tT9qp6H TXOas0HuAdnSOU8JmetlfH2h/ohoRwx+QHmKhT92Er46h21ZM2HiFLNwlCr/Zvnf4wBQPJ/U+ MHLIyswowpOlGWPxjmUYruyce4woAukpSVrpV0Ij9MrXaEMs3f2tozeTFrk9aaDaufLFHggM3 RANCbQOXrZgPlFC6b4Nty093dMQwWNpXwQVvqc05CUqH0tj9RpDht5hBSI/a47gZhcUnh+a1F t0VxlKs6ILtN+yqQ/F1l07y4UlxK1VOfn+LvtcBb6w6Wh7U0iD7pyeA8twbnJq9cwgpn5NYF1 K6TsKSaJPf7PwYMv5ZXaqdFxmljimEarZvotdJVAWgaJhMe+z6UAwUXmyTr6nt2E6CAo6b/Qk E3Qi5pneonXLPyIKHmq21C7P+dNAM9DmS589UWVIgE6fBDEn2Ga//fbvb8gbvm1sbyChV5rrN lV9cck1Bv/IZQ5GRytFOL1T+v0dV/XqFrrQu0BCOu7MVvRdvVBd0fMQmtFlMgKjHN6BWtex5v 4H3bm+DhUQeu2f2d4YW2SsYod7ZZ+i++a/lgq58CBokBfLky4MZSjNAjc6Jcan3PZnuHeoH9O TAbUGHknHMxQmLSgpfL9Ze/hbTFPTZgtq4SYiA8ekh38E+DCl4sPIoSiy+FfglxKIM2oD0iYF SQa9NZiIPnraxN59Hl+RakAO+O7jkvkQ4qKfcHnfQOp9KQppQgZ2lvXAwLAF3p4/Fbw8ZAG4x Nl3MZq5zLOk9cf689t+rSZcPYitDjla6TV2O0Ihkoa3e0C05e7xyiVJ52GVhuJgvPTnmp1B7y ske+hxbX4G+xiyt6Vvf8IfqhRqVsCz6L8eR5fF61YIF5RS3OaC6MbndOKfau0JdqgladGgsuM ixqjbCF2KBHhHYOq362xYfHwUKj+QOhYVReYINM5Ef2tzWVyidB/QRhpchHO8Rm44yksouu+A wHXpHDN5YJvi/htHQvczLM8Jq67MJZpY9A/udZVSb4oJPBsKNeCv9Ng2irFBQ0vGtzxVL2fGO m+F8w5sIYEtg3Z4X20xcp2M6IwGs0KGNP0LL1s05fOcshuTFHgA4JVpF4T5wLmzDJ/Y1VkzU3 OLwPcLEKgV172jd+RuGrMZItGRzqeri0/ktHmykauHTJM89vuzk4bocLzXov8ypgpPjw48ZJV TlsvjGTWc7JqJYZ5KkPwd+PycqJr9DK/jMdfRS+kkGM3Z3YWenB208gPt29xVfUd7dvu3qYUU 1Uz79jGSfdxr+oCyzZJwRaIiJ+W4i5G2gOZflXrl10FrtP794P2Gzrye8nfd5SkwHMGxyL35v TMjIqe+jI9KcPvecT2fLrezG19i5PRg1sZDjVh9CKgL4tTlblsXngVx5ik8Ii4nGvuel1Eqh3 6aDvXmMVHg2Zdisv/p8pA1oQdSaKPAK+lU9bcOPlgMrOVhrzD1algmqbZmD0X8+3iwIbJeZ4A GaoK0amlQDMQ4iKQDLq1CwyeMGpAFi0DQr7hmnQrhGgOa82cglkbip1zE/KlGSdBi9eVBx3ou 8WDS7vBHIeQZwbAdfSjaJ2+IJirUSUrrSk8C6oM50HLNJduFIB3oa5agNxoeiswbpVHug8ueg HzUgkqqNHqoWcq9d6vTKaRm8cRvd4Zj8lEEYcZymehEc9mnkuWWKfnELEKqpK3viN2kyDv84Z EJ0tWQw9jONkduUZ8ZSHSAqWYkVQqQXM1ShMElQt/P8gkFy2tarmqhihbN92RnlO+03nm5WUB Wg8nzAHedaCHkWO1bPs+ccl2rPcHL78ftvE9pc5SrDnP1KfOan86H92YOUMIlseLOPk5oGNS7 2FYB+FSd5SzC451oNY1fh+f/rSD61Lfqk+N7R3e6W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_112721_418164_0C0936FA 
X-CRM114-Status: UNSURE (   8.62  )
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
> ---
> v4:
=E2=80=A6
> - No functional change from v3. Still no Fixes tag: I don't have a
>   git history for this file available in my current environment to

How can this happen?

Are you still looking for more convenient user interfaces?

See also:
* https://git-scm.com/docs/git-blame
* https://www.geeksforgeeks.org/git/how-to-use-git-blame/#an-alternate-opt=
ion-to-the-command-line-gui-based
* https://stackoverflow.com/questions/31203001/what-does-git-blame-do


>   identify the commit that introduced this exit path with confidence,

I assume that corresponding patching experiences can grow.


>   and would rather leave the tag off than guess a SHA. Still happy to
>   add it in a v5 if Markus or anyone else on Cc can point at the right
>   commit.

It would be nice if further advice would be added accordingly.


=E2=80=A6
>  drivers/mailbox/mtk-cmdq-mailbox.c | 15 +++++++--------=E2=80=A6


Regards,
Markus

