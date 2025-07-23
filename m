Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E308DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtkieUEHX0j7NOkthBC+xkyEn4NoDmNOetl5nOn3gOo=; b=a8/smYcqqY3uUqJiu6vWaUlwUy
	VCZCF6su5WKD5ZvRMUjEgr6somXoH1pDDGqCancnR+zApurr3v6NEvUhPs8mZVmPJph3WtfL2Q+UW
	QAFcxGEAsenWZy6n1JR1IX9+rTkgUMogF4t17Fdtc3HbmokG3Orv6q1x/99ZIP3ZwXjReMzyljkhW
	G87eEx8wWSSGFRowEC2lauDH2op2KSbGufd+dXJOW7IK+Njg5AmHHlzPp++Zt0MXL5HB3+fK2zUg0
	jSmh9/yKydjlqEIDtQY17I6QIsIRxq+m9Ptnvd1PnUfDAOosml+MlOf+fC6gDmraKs6/A8wZSi7Um
	015nzofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebuj-00000005SRn-2v6B;
	Wed, 23 Jul 2025 16:01:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebqY-00000005Rrs-2ddD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:57:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N99TaI023091
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 15:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtkieUEHX0j7NOkthBC+xkyEn4NoDmNOetl5nOn3gOo=; b=OVCYvSH8JEgtNcW/
	Hvr2RshnKt96aXumsRwK3VvezPHpxY/onja3yBGT/IIGtR4nCEtkaMEiF9WPjedY
	RxXqoKh/FUtVddKCdpSrLF4y9RJZB01MLgZ/rRAe2ly5cMVB2Z8fnLGPYCOBNqTP
	XpV1ECegQvR6l9sXSKPVXdLEe1kXrJurmsK0Qm5i8pWu0F0VxkFOkz1b43Kzes/o
	0FcHb6qpslb9VTVWj6+vI3yrnAJ0D/+owCPz1JLCMn1Oo1d9/MaoE0fU2gr0Tad8
	2owIPQUk1tZMp8dVnpgVvP4XWUisK/n8k85PzPvDWSt/y+jZ7hgIpSLoXinwjCOY
	Brvz2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ucax3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 15:57:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4aba439b4ffso552191cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 08:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753286252; x=1753891052;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtkieUEHX0j7NOkthBC+xkyEn4NoDmNOetl5nOn3gOo=;
        b=RJf/OSo3YwOwrs1+iU3Eo4p/TKja2Urppk3g3E4IrWvYzF5s59nMaemlVdwz3zDg6J
         +65cYdN3PJDEgueb09AaQwrVnuvaFn+0gNqqgG05OzSavsSLiJFM8zv3cGCkTZNdL1eg
         1Im4WhtWZA6kkWrqE4EpR6mtpxuOa+hWNGrbEEQVwpD+GdwlhrEXnFAryw7DNf+995ey
         gBXyzVIyh3uRKLoSh15amBRxaong7gCuUnrdhnjyRxIzFHWDzSGZKnduCovGIJr33DfZ
         O1UxaCNicVOM11VhNx7klSi38JWLQsY6bhHRvWD/1fOQ3biCn8ptjwyVelSANSHWHQ7H
         hhTA==
X-Forwarded-Encrypted: i=1; AJvYcCUUBi0cE21ncoHSLl/OFVnPuo3RI3aOGTMioQyJ4DHgX5QavqeqI8ZaBuNcHFWzd4O849VBBV6t4je18XK5MNm2@lists.infradead.org
X-Gm-Message-State: AOJu0YyKaVrgX8+ni6f9H+r0R5Uxyvlo5nGW4mqAU4h6jGik4waGJ63E
	utqkM8owRb3dekzGAoj/Hm9/5mF/ZSxiF+TdTE5zFs7tjw/HB0HQvy1CVZHCoTHxulbr/oB+CTu
	JFNN0lbF6ws1KwhI98awhuqW5X5NK4cw+/vZu2xGMebhjdyf2UREYXffQ/qcUPi5lKwueGVdkRO
	WUbg==
X-Gm-Gg: ASbGncuxTBkiEY/I/lyg7RIJ5gD62Vci8Nj+i8OaieJcFan6dQlb55MSNP78hh7T7tD
	LqOUF2DIaDweoejdrq1f6OElTvLE5Mw7NUA8wkvDGf8y0gGHyze3WQ7XXqSTPCnGy/Ye69b5v0l
	j2epj4Q/H+ju58C2PWPUHUaiA8+vQx3bkwu8HbdZeTIYVhZFZSUe7+nurE8PAUvE7JLDk56WQPJ
	EkFpWjb7T2JFmlp9k9iVOc5TxXyqQmxYpcMPlz8OuVovA2aW77hZ9EzNOCDDhp3SR9Kqc/ILBCH
	D3usW6Whuel76BXCdjJpYsswmyDs23ag8tA=
X-Received: by 2002:a05:622a:1482:b0:4ab:5d1a:93bd with SMTP id d75a77b69052e-4ae6de8785emr46129001cf.23.1753286251737;
        Wed, 23 Jul 2025 08:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENrtc6QBbO0UPOgNoyMOBayciVcsK2EoG0Ya9QJi7FVg7P5WTjyM0W0swWYhkBXSIiTPi+sQ==
X-Received: by 2002:a05:622a:1482:b0:4ab:5d1a:93bd with SMTP id d75a77b69052e-4ae6de8785emr46128651cf.23.1753286251322;
        Wed, 23 Jul 2025 08:57:31 -0700 (PDT)
Received: from [192.168.1.17] ([61.2.112.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae5c52c3d0sm24709271cf.26.2025.07.23.08.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:57:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250709033722.2924372-1-hongxing.zhu@nxp.com>
References: <20250709033722.2924372-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v4 0/2] PCI: imx6: Refine apps_reset and EP link
 behavior
Message-Id: <175328624589.28758.7232251472383556230.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 21:27:25 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6881066d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=L2vWZV9GmkZVUxua0bORKQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=L_pc-btOT9_bO7MH69IA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEzNyBTYWx0ZWRfX0SGYnCMJd768
 w+qJp69Mit5lttiU+7ANmZ20fvw8YQ/sH+6Lt06j0Wsug1iO5uTOtl1Sa1I5N7AJR/7CgzTOPyS
 FUbUdlJjPB8BbUXdb8wuJ6cJA0quNIUrc/l/WRageqqCepD8PxBC/rIYUZxrLb/KdHiFD9wcPyy
 A2FJExrjbHgBKmhOxjqhoR8xWb5tsps0G3GnWn0uyYH3ELSGUsOvDMJkIowC1eWUVZAMRerkSPs
 Oscus5c61BfBmlMJuduzoUahCt1JC8mDgjbK/k8an+PgTCOyS2o2lYI9z23Sa+ZxeJa+IJyQKyt
 m32Fjc/IBVRJd/w1fqQcHcSXBT84lYkA7Vtz09VvyPfZ5WYJNY4JMx+746wBcoLtFX9SdS9HWEN
 oqzU9dy8OEivJgNEEjFk5YrqMYWr4Jbwd7LyX6ayCiRiZWfcKZCVgGzfDbu8wGISnDoup+9u
X-Proofpoint-ORIG-GUID: e7bkOAGks9IvOXatnCsPDHQSOCJNDQ3f
X-Proofpoint-GUID: e7bkOAGks9IvOXatnCsPDHQSOCJNDQ3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=596 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_085734_715796_550AA491 
X-CRM114-Status: GOOD (  11.22  )
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


On Wed, 09 Jul 2025 11:37:20 +0800, Richard Zhu wrote:
> apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
> Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
> 
> Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> and imx_pcie_ltssm_disable() to configure apps_reset directly.
> 
> [...]

Applied, thanks!

[1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
      commit: 315b747ae6b07ffabb27ed8ca584e6e6df8050a5
[2/2] PCI: imx6: Align EP link start behavior with documentation
      commit: a43b68bc510aa61a5b7618c79784dbc83074e504

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


