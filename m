Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DACC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEX86ieQtTjcsMrvm61w0FN/i4G3RKlhYgTWDNp/5kQ=; b=Yomvix8LXbMiesQVTx1KbnohLO
	Kzv9kbn02TkDCaeeCpepWKqaKzX/6WsGhV72JAU9dlt51lwL4d7EH9VGDQKKZ8abJbsDw4+WQEyid
	Ve0WJF5Pz8Q+RVZNS26OGu+4dxfCDfmjrnuZqU3c4LUng7CAEUAf6vT7HkMtm/LRRQyXUltKA3T6O
	vMUa3+UD6/KmICrkSYCpg+Rgg3+c5IuzxMljZTo3gqaNzBdw4E0Nr8KX3y+T+cu2MCdoy8cOcYF2W
	JHbcykQ0aeRGnqJqeTVuYfw+4lF1rdM65x0UTATcFxzWhyDuQxph3LeXgPb+aGw8paOFMMMdeaz9d
	ONXOgwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WnS-00000007YOC-3PUA;
	Wed, 09 Apr 2025 14:52:58 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WLd-00000007RHV-0lel
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 14:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744208642; x=1744813442; i=markus.elfring@web.de;
	bh=FEX86ieQtTjcsMrvm61w0FN/i4G3RKlhYgTWDNp/5kQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=olLEdyb9QhIEe2b+MMOQ4sF0MMbx/vSk6E0kv0p/w8KYLIRB+hh10n9pgxgXrCCW
	 4L2MKYie4uGqRcHAIM/ZQhpAXAGJCcdO5mDjcGX3usmqxxv7m7mBXGg+NVwNBo5Zh
	 s+eD8sa/OWxwPimDUTb/2x5kJyoQGrquMaX7pKmYypVYq/JlFkVo36NlEfIQG3aLA
	 KzdzYdd8cVLBpnUn2T/gxI8ltQ+++AQjaRsJhJt0SM7CVDOs0PQHMyYU8J2t7UJ0q
	 RZJLPe8mEIQHZnKI/PXfDCKSsjqx/aBeE/jzvSi+AhBKxtWBqEJbFgNY+BUr30k5N
	 QHwsjl9lDp0HzE+KBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.27]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MVrft-1tbP7f0J4X-00MPqE; Wed, 09
 Apr 2025 16:24:02 +0200
Message-ID: <daf7934a-17f7-4e41-ba00-cec155437c7e@web.de>
Date: Wed, 9 Apr 2025 16:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference in
 get_rate()
To: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Henry Martin <bsdhenrymartin@gmail.com>, arm-scmi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
 <0558b7f7-8c69-4664-afc6-bae4fdc6f071@web.de>
 <20250409-merry-gay-lemur-8288cf@sudeepholla>
 <52aa52a5-7081-41ee-872e-f1728c06daf1@web.de> <Z_Zhp38o9KiicPVw@pluto>
 <3f5662dc-7547-4585-a396-4546fa98d34f@web.de>
 <20250409-glistening-hasty-ape-c9c7e9@sudeepholla>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250409-glistening-hasty-ape-c9c7e9@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t5v7mMZJZZsS+n267hBMyKvP4/+RVlchh+BOFxAknfqwRji+4RW
 GJJCwak089+mygl9TaQLJxO9SecKQ83EoLnNIHTGpv9rSZpYMCue7oc0vULqJ9F+ieswSng
 f+7k0YST3xTps3fs4RFvL63F7eSU9mXjPNa/XvLH4V1/ZscD4ROaJeAiar6rNCu9Yr24NLs
 UOVKQTdttGjcIsLTP0rkA==
UI-OutboundReport: notjunk:1;M01:P0:HOIHOb3bGZ4=;1rP3BcuxMDYjjaUCQBgbe3i9IxE
 wM4gO39oEm9HdYKzPTnx3fUD9f3EKCGO7sUMwuU7Qp+WSJetes3zhWBpXv9lbLbcU/fjOXQ0D
 yiGMi/1DeSgyjxJdS9kcjrLdpj1DsevuYXD9rSV83BjV69c1952DNdJgyvKeNnJsQ2A9F1Qi/
 RijB94SnsfaFiJPj6piqdgOxlLkMRjAc3RcqiuHel4fALDVeC9Lt2DR8qBzsvUllU6VlLTUif
 w/g3L8YfTIcrQbWoWv89Hxj1d2mDeOmCYYMoghgEJEZ4ZSaG8QSnH9solSeS4QMy1E7XgLjBC
 2w14jmra2DMHyD9BMR/pOKHtaZltpQQUcoB4MMur2Pt/tVvXSoIpfb3n1t1Jd7CaeS10qwsRA
 XH6hEv+5gDAIHLk9dJik7AKsXUUs/c3c9iXrgCel+T/pT62ibsSrAEPfW7VrwRQIhDiLviIaT
 xRqLv3I+ek/Dpk5E9GtQttd6SYefM+e8pCGvh/UL9zBPgKpNr0yUnSe9lWEFrh+PToa45egSw
 aEzv8F3nnexauzHHt2Y3fCrodKO8NFpP7UAEzCmbOVuLk9fWwwaVR6okh8PnuFKYxnpgjWPP5
 ccLUE8WA+K0qHr1OJ3NL7FIe9XpQ5IIahARNb8o3UcAYjqtHB5h72U/EHmiSAfl1U8GfcotKt
 VnYT9QQ74TVYlong1Pgw9fHZg0jFWygUqCbCPTvjk9Mai9/svhdflEmvM5J+ggDIUS2zDrhkY
 T8ochudKdXJ1rzDV+d3GF2q3gGrm5LiaxlSuzxnQ4+MrSULS3m1jyUIbe84JtOFFu3nhvGFO4
 PhGuATu2NExKNmbp5YBVuWrwy2EjWYMGIu83bfvnG/js933lPfGnn/BpK3MOIjSqqqw97WTWc
 0VdDbGGkYBQdgfmcdqermzaVwCnl3pG5z9s3nI+wA+afG07MmsnIM81P6Tkeo77t3T1+8mWGf
 wE91b6jim3eE0/zfs7SzG1GLU/E3PupDO4VJFnvGOQ5IFTXmjtB/YB4blaJw3FgGHM9zS8H8q
 qLQKhltSWHqsAbTUNUpFLVOXL9JMTWE77xpcdHBI2krJDv+iEe8NH51cUJIl3PBwhFMg8itkN
 H9veGeDqDZWkytci/7eq7xeI7jyN9i6OMDRy/gukxF713zHW/UV/d5EQMRMykJ0LW6Zc7UI9X
 ap6naO/L6B5MXmzTxV6w66dn0c8dccsgA5UMtTeeEDlFCBlrG0uBc271sPwFW/n1iCt4FLQwT
 3ltqpcxa7Ou8rx+TfUHcjZ03IjtP+AKlJbScxWRLEZDNL92XlJGYM+tkO/aylCmMuazNTxQQ2
 6ha2SjasrUxa1eZ6UgBoATbpyzL88CryofWpBNPO8Ee9O6/q8i5wU20Zrhe4fcsmL1wezrIYw
 ifCsR77pR6BhHYL6bQbk2nA8zq+9/DocHITIfp3lTDgKKFvlQCn5UaQkHGySXiwarQSl3Kyqt
 3weslyYFLRKXYMcHcwNTIJtPHFoMcLT+bBBPvhTUftCmEjUruqQRAldHrebKfqBwpimqB0KY5
 JzaegFLNIz5sitxTED8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_072413_586068_2950B879 
X-CRM114-Status: UNSURE (   4.21  )
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

>> May the usage of abbreviations be reconsidered once more also for such =
messages
>> (in presented update steps)?
>
> Still can't understand you. Sorry for that. =E2=80=A6

Will any communication challenges need further clarifications also accordi=
ng to
wordings like the following?
* null-ptr-deref
* null pointer dereference

Regards,
Markus

